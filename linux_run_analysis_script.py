import subprocess
import shutil
import os
import pandas as pd

wmi_mapping = {
    'Linux_WMI1': ['Taint Source', 'Taint Sink', 'Instruction', 'Address', 'Program Location'],
    'Linux_WMI2': ['Taint Source', 'Taint Sink', 'Instruction', 'Destination', 'Source', 'Size', 'Program Location'],
    'Linux_WMI3': ['Taint Sink', 'Instruction', 'Program Location'],
    'WMI1_OOB_WRITE_PRIMITIVE': ['WMI Function', 'Taint Source', 'WMI Operand 1', 'WMI Operand 2', 'Instruction', 'Debug', 'Program Location'],
    'WMI2_WRITE_WHAT_WHERE_PRIMITIVE': ['WMI Function', 'Taint Source', 'WMI Operand 1', 'WMI Operand 2', 'Instruction', 'Debug', 'Program Location'],
    'WMI3_CONTROL_FLOW_HIJACKING_PRIMITIVE': ['WMI Function', 'WMI Operand 1', 'WMI Operand 2', 'Instruction', 'Program Location']
}


def convert_WMI_csv_to_json(directory_path):
    # List all files in the directory
    for filename in os.listdir(directory_path):
        if filename.endswith(".csv") and "WMI" in filename:
            file_base = os.path.splitext(filename)[0]
            if file_base not in wmi_mapping:
                print(f"Skipping '{filename}': No column names provided.")
                continue
            
            csv_path = os.path.join(directory_path, filename)
            json_filename = file_base + ".json"
            json_path = os.path.join(directory_path, json_filename)
            
            try:
                # Read the CSV file
                df = pd.read_csv(csv_path, delimiter='\t', header=None, names=wmi_mapping[file_base])

                # Write to JSON file
                df.to_json(json_path, orient='records', lines=True)

                # print(f"Converted '{filename}' to '{json_filename}'")
            except Exception as e:
                print(f"Error processing '{filename}': {e}")

# Ensure the output directory exists
output_dir = './bcfiles/linux_bcfiles'
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

analysis_project_path = f'./linux-standalone.project'

# Read file names from filelist.txt
with open('linuxfilelist.txt', 'r') as file_list:
    files = [line.strip() for line in file_list if line.strip()]

files.append(f'kbmi_usb/kbmi_usb_final.c')
files.append(f'kbmi_net/kbmi_net_final.c')
files.append(f'kbmi_usb/kbmp_kbmi_usb_final.c')
files.append(f'kbmi_net/kbmp_kbmi_net_final.c')

for file_name in files:
    # Define input and output paths
    input_path = f'drivers/{file_name}'
    output_path = f'drivers/{file_name.replace(".c", ".bc")}'
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
    
    convert_WMI_csv_to_json(analysis_dir_path)


#Zip the results
zipcommand = [
    'zip', '-r', 'linux_sa_results.zip', f'{output_dir}'
]

try:
    subprocess.run(zipcommand, check=True)
    print(f"Zipped the results: linux_sa_results.zip")

except subprocess.CalledProcessError as e:
    print(f"Error compiling {file_name}: {e}")