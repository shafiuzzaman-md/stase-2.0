import subprocess
import shutil
import os

# Ensure the output directory exists
output_dir = './UCSB_TESTCASES/KERNEL_TESTCASES_STASE'
os.makedirs(output_dir, exist_ok=True)


base_fact_command = [
    'factgen-exe', '--context-sensitivity', '9-caller'
]

make_dir_base_command = [
    'mkdir'
]

base_souffle_command = [
    'souffle', '--no-warn'
]

analysis_project_path = f'./UCSB_TESTCASES/KERNEL_TESTCASES_STASE/linux_testcase.project'

# Read file names from filelist.txt
# with open('linuxfilelist.txt', 'r') as file_list:
#     files = [line.strip() for line in file_list if line.strip()]

files = []
# files.append(f'kbmi_usb/kbmi_usb_final.c')
# files.append(f'kbmi_net/kbmi_net_final.c')
# files.append(f'kbmi_usb/kbmp_kbmi_usb_final.c')
# files.append(f'kbmi_net/kbmp_kbmi_net_final.c')
files.append(f'vusbx.c')
files.append(f'vusby.c')


for file_name in files:
    # Define input and output paths
    input_path = f'drivers/{file_name}'
    output_path = f'{file_name.replace(".c", ".bc")}'
    output_bcfile_path = os.path.join(output_dir, os.path.basename(output_path))
    facts_dir_path = f'{output_bcfile_path.replace(".bc", "_facts")}'
    analysis_dir_path = f'{facts_dir_path.replace("_facts", "_analysis")}'

    main_fact_command = base_fact_command.copy()
    main_fact_command += [
        f'{output_bcfile_path}', '-o', f'{facts_dir_path}'
    ]

    make_dir_main_command = make_dir_base_command.copy()
    make_dir_main_command += [
        f'{analysis_dir_path}'
    ]

    main_souffle_command = base_souffle_command.copy()
    main_souffle_command += [
        '-F', f'{facts_dir_path}', '-D', f'{analysis_dir_path}', f'{analysis_project_path}'
    ]

    try:
        subprocess.run(main_fact_command, check=True)
        print(f"Facts generated successfully")

        # Copy the resulting .bc file to the bcfiles directory
        subprocess.run(make_dir_main_command, check=True)
        print(f"Directory created successfully")

        subprocess.run(main_souffle_command, check=True)
        print(f"Analysis generated successfully")

    except subprocess.CalledProcessError as e:
        print(f"Error compiling {file_name}: {e}")
    except FileNotFoundError:
        print(f"File not found.")

#Zip the results
zipcommand = [
    'zip', '-r', 'UCSB_linux_sa_results.zip', f'{output_dir}'
]
try:
    subprocess.run(zipcommand, check=True)
    print(f"Zipped the results: ucsb_linux_sa_results.zip")

except subprocess.CalledProcessError as e:
    print(f"Error compiling {file_name}: {e}")