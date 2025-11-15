import subprocess
import shutil
import os

# Ensure the output directory exists
output_dir = './bcfiles/linux_bcfiles'
os.makedirs(output_dir, exist_ok=True)

dircommand1 = ['git', 'clone', 'https://achintya:glpat--pj5iorQXTobVwzjym5W@repo.iti.illinois.edu/harden/all-harden-users/test-cases/eval2/eval2_linux.git', 'linux/src']


# Run the clang command
try:
    subprocess.run(dircommand1, check=True)
    print(f"Unzip successful")

except subprocess.CalledProcessError as e:
    print(f"Error in make command {e}")



prepcommand1 = ['make', 'defconfig']

prepcommand2 = ['make', 'ARCH=x86_64', 'prepare']

prepcommand3 = ['git', 'apply', 'kbmi_usb_fix.patch']

prepcommand4 = ['git', 'apply', 'dynamic_utils_fix.patch']

# Run the clang command
try:
    subprocess.run(prepcommand1, check=True, cwd='./linux/src')
    print(f"Make defconfig successful")

    subprocess.run(prepcommand2, check=True, cwd='./linux/src')
    print(f"Make prep successful")

    subprocess.run(prepcommand3, check=True)
    print(f"Patch 1 applied successfully")

    subprocess.run(prepcommand4, check=True)
    print(f"Patch 2 applied successfully")

except subprocess.CalledProcessError as e:
    print(f"Error in make command {e}")



# Read file names from filelist.txt
with open('linuxfilelist.txt', 'r') as file_list:
    files = [line.strip() for line in file_list if line.strip()]

# Base clang command (excluding file-specific parts)
base_command = [
    'clang', '-emit-llvm', '-Wno-unused-label', '-nostdinc', '-std=c99',
    '-isystem', '/usr/local/bin/../lib/clang/3.8.1/include', '-I./arch/x86/include', 
    '-I./include', '-Iarch/x86/include/generated/uapi', '-Iarch/x86/include/generated', 
    '-Iinclude', '-I./arch/x86/include/uapi', '-Iarch/x86/include/generated/uapi', 
    '-I./include/uapi', '-Iinclude/generated/uapi', '-include', './include/linux/kconfig.h', 
    '-D__KERNEL__', '-Qunused-arguments', '-Wno-unknown-warning-option', '-Wall', 
    '-Wundef', '-Wstrict-prototypes', '-Wno-trigraphs', '-fno-strict-aliasing', 
    '-fno-common', '-Werror-implicit-function-declaration', '-Wno-format-security', 
    '-std=gnu89', '-no-integrated-as', '-mno-sse', '-mno-mmx', '-mno-sse2', 
    '-mno-3dnow', '-mno-avx', '-m64', '-mtune=generic', '-mno-red-zone', 
    '-mcmodel=kernel', '-funit-at-a-time', '-DCONFIG_X86_X32_ABI', '-DCONFIG_AS_CFI=1', 
    '-DCONFIG_AS_CFI_SIGNAL_FRAME=1', '-DCONFIG_AS_CFI_SECTIONS=1', '-DCONFIG_AS_FXSAVEQ=1', 
    '-DCONFIG_AS_SSSE3=1', '-DCONFIG_AS_CRC32=1', '-DCONFIG_AS_AVX=1', '-DCONFIG_AS_AVX2=1', 
    '-DCONFIG_AS_SHA1_NI=1', '-DCONFIG_AS_SHA256_NI=1', '-pipe', '-Wno-sign-compare', 
    '-fno-asynchronous-unwind-tables', '-O0', '-Wframe-larger-than=1024', 
    '-fno-stack-protector', '-Wno-unused-variable', '-Wno-format-invalid-specifier', 
    '-Wno-gnu', '-Wno-asm-operand-widths', '-Wno-initializer-overrides', '-fno-builtin', 
    '-Wno-tautological-compare', '-mno-global-merge', '-fno-omit-frame-pointer', 
    '-fno-optimize-sibling-calls', '-g', '-Wdeclaration-after-statement', 
    '-Wno-pointer-sign', '-fno-strict-overflow', '-Werror=implicit-int', 
    '-Werror=strict-prototypes', '-Werror=date-time', '-Wno-initializer-overrides', 
    '-Wno-unused-value', '-Wno-format', '-Wno-unknown-warning-option', '-Wno-sign-compare', 
    '-Wno-format-zero-length', '-Wno-uninitialized', '-DMODULE', '-DKBUILD_STR(s)=#s', 
    '-DKBUILD_BASENAME=KBUILD_STR(all)'
]

# Process each file
for file_name in files:
    # Define input and output paths
    input_path = f'drivers/{file_name}'
    output_path = f'drivers/{file_name.replace(".c", ".bc")}'
    dependency_path = f'{os.path.dirname(input_path)}/.all.o.d'
    output_bcfile_path = os.path.join(output_dir, os.path.basename(output_path))

    command = base_command.copy()
    command.insert(2, f'-Wp,-MD,{dependency_path}')

    # Define the specific command for the file
    command += [
        f'-DKBUILD_MODNAME=KBUILD_STR({os.path.splitext(os.path.basename(input_path))[0]})',
        '-mcmodel=kernel', '-c', '-o', output_path, input_path
    ]

    # Run the clang command
    try:
        subprocess.run(command, check=True, cwd='./linux/src')
        print(f"Compiled {file_name} to {output_path}")

        # Copy the resulting .bc file to the bcfiles directory
        shutil.copy(f'./linux/src/{output_path}', output_bcfile_path)
        print(f"Copied {output_path} to {output_bcfile_path}")

    except subprocess.CalledProcessError as e:
        print(f"Error compiling {file_name}: {e}")
    except FileNotFoundError:
        print(f"File {file_name} not found.")


    disasscommand = ['llvm-dis-14', f'{output_bcfile_path}']
    try:
        subprocess.run(disasscommand, check=True)
        print(f"Disassemble successful")

    except subprocess.CalledProcessError as e:
        print(f"Error in disassemble command {e}")

    print(f"{file_name}")

    if file_name == f"misc/dynamic_util.c":
        link_input = os.path.join(output_dir, f'kbmi_usb.bc')
        link_output = os.path.join(output_dir, f'kbmi_usb_final.bc')
        linkcommand = [
            'llvm-link-14', f'{link_input}', f'{output_bcfile_path}', '-o', f'{link_output}'
        ]
        # Run the clang command
        try:
            subprocess.run(linkcommand, check=True)
            print(f"Linked {link_output}")
        except subprocess.CalledProcessError as e:
            print(f"Error compiling {file_name}: {e}")
        
        linkdisasscommand = ['llvm-dis-14', f'{link_output}']
        try:
            subprocess.run(linkdisasscommand, check=True)
            print(f"Disassemble successful")

        except subprocess.CalledProcessError as e:
            print(f"Error in disassemble command {e}")

        link_input = os.path.join(output_dir, f'kbmi_net.bc')
        link_output = os.path.join(output_dir, f'kbmi_net_final.bc')
        linkcommand = [
            'llvm-link-14', f'{link_input}', f'{output_bcfile_path}', '-o', f'{link_output}'
        ]
        # Run the clang command
        try:
            subprocess.run(linkcommand, check=True)
            print(f"Linked {link_output}")
        except subprocess.CalledProcessError as e:
            print(f"Error compiling {file_name}: {e}")

        linkdisasscommand = ['llvm-dis-14', f'{link_output}']
        try:
            subprocess.run(linkdisasscommand, check=True)
            print(f"Disassemble successful")

        except subprocess.CalledProcessError as e:
            print(f"Error in disassemble command {e}")

    if file_name == f"kbmp/kbmp.c":
        link_input = os.path.join(output_dir, f'kbmi_usb_final.bc')
        link_output = os.path.join(output_dir, f'kbmp_kbmi_usb_final.bc')
        linkcommand = [
            'llvm-link-14', '--override', f'{link_input}', f'{output_bcfile_path}', '-o', f'{link_output}'
        ]
        # Run the clang command
        try:
            subprocess.run(linkcommand, check=True)
            print(f"Linked {link_output}")
        except subprocess.CalledProcessError as e:
            print(f"Error compiling {file_name}: {e}")
        
        linkdisasscommand = ['llvm-dis-14', f'{link_output}']
        try:
            subprocess.run(linkdisasscommand, check=True)
            print(f"Disassemble successful")

        except subprocess.CalledProcessError as e:
            print(f"Error in disassemble command {e}")

        link_input = os.path.join(output_dir, f'kbmi_net_final.bc')
        link_output = os.path.join(output_dir, f'kbmp_kbmi_net_final.bc')
        linkcommand = [
            'llvm-link-14', '--override', f'{link_input}', f'{output_bcfile_path}', '-o', f'{link_output}'
        ]
        # Run the clang command
        try:
            subprocess.run(linkcommand, check=True)
            print(f"Linked {link_output}")
        except subprocess.CalledProcessError as e:
            print(f"Error compiling {file_name}: {e}")

        linkdisasscommand = ['llvm-dis-14', f'{link_output}']
        try:
            subprocess.run(linkdisasscommand, check=True)
            print(f"Disassemble successful")

        except subprocess.CalledProcessError as e:
            print(f"Error in disassemble command {e}")
print("Processing completed.")
