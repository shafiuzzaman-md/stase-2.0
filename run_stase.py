import os
import subprocess

# Command to clone the Git repository
clone_command = [
    'git', 'clone', 'https://achintya:glpat-EJAXEZSyH54QMZRz5j7W@code.iti.illinois.edu/harden/harden-ta3-cromulence/phase2/eval2/eval2_edk2.git', 'eval2_edk2-main'
]

# Run the clone command
try:
    subprocess.run(clone_command, check=True)
    print("Clone successful")
except subprocess.CalledProcessError as e:
    print(f"Error in git clone command: {e}")
    exit(1)

# Check if the directory exists
if os.path.isdir('eval2_edk2-main'):
    print("Directory eval2_edk2-main exists.")
else:
    print("Directory eval2_edk2-main does not exist. Clone might have failed.")
    exit(1)

# Define each command as a separate step
commands = [
    ['python3', 'stase/process_headers.py', os.path.abspath('eval2_edk2-main')],
    ['python3', 'stase/remove_macros.py'],
    ['chmod', '+x', 'stase/build_stase.sh']
]

# Run each command separately except for build_stase.sh
for cmd in commands:
    try:
        subprocess.run(cmd, check=True)
        print(f"Command {' '.join(cmd)} ran successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error in command: {e}")
        exit(1)

# Run build_stase.sh using os.system to avoid subprocess issues
try:
    os.system('cd stase && ./build_stase.sh')
    print("build_stase.sh ran successfully.")
except Exception as e:
    print(f"Error in build_stase.sh: {e}")
    exit(1)

# Run the final command using subprocess
try:
    subprocess.run(['python3', 'parse_output.py'], check=True)
    print("parse_output.py ran successfully.")
except subprocess.CalledProcessError as e:
    print(f"Error in parse_output.py: {e}")
    exit(1)

print("All commands completed successfully.")
