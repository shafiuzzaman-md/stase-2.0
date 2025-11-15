import subprocess
import shutil
import os

# Ensure the output directory exists
output_dir = './bcfiles/edk_bcfiles'
os.makedirs(output_dir, exist_ok=True)


dircommand1 = ['git', 'clone', 'https://achintya:glpat--pj5iorQXTobVwzjym5W@repo.iti.illinois.edu/harden/all-harden-users/test-cases/eval2/eval2_edk2.git', 'eval2_edk2-main']


# Run the clang command
try:
    subprocess.run(dircommand1, check=True)
    print(f"Unzip successful")

except subprocess.CalledProcessError as e:
    print(f"Error in make command {e}")


#git submodule update --init

prepcommand = (
    "git -c submodule.\"UnitTestFrameworkPkg/Library/SubhookLib/subhook\".update=none submodule update --init && "
    "source edksetup.sh && "
    "make -C BaseTools && "
    "git apply ../tools_clang.patch && "
    "build -a X64 -b NOOPT -n 4 -d 2 -t CLANGPDB -p OvmfPkg/OvmfPkgX64.dsc -D NETWORK_HTTP_BOOT_ENABLE -D NETWORK_TLS_ENABLE -D E1000_ENABLE -D DEBUG_ON_SERIAL_PORT -D IPSEC_ENABLE -D NETWORK_IP6_ENABLE -D SMM_REQUIRE=TRUE"
)


# Run the clang command
try:
    subprocess.run(['bash', '-c', prepcommand], check=True, cwd='./eval2_edk2-main')
    print(f"Command successful")

except subprocess.CalledProcessError as e:
    print(f"Error in make command {e}")

# Read file names from filelist.txt
with open('edkfilelist.txt', 'r') as file_list:
    files = [line.strip() for line in file_list if line.strip()]

for file_name in files:
    input_path = f'Build/OvmfX64/NOOPT_CLANGPDB/X64/{file_name}'
    output_path = f'Build/OvmfX64/NOOPT_CLANGPDB/X64/{file_name.replace(".obj", ".bc")}'
    output_bcfile_path = os.path.join(output_dir, os.path.basename(output_path))

    # Run the clang command
    try:
        # Copy the resulting .bc file to the bcfiles directory
        shutil.copy(f'./eval2_edk2-main/{input_path}', output_bcfile_path)
        print(f"Copied {input_path} to {output_bcfile_path}")

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
