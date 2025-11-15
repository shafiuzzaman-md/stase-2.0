import difflib
import shutil

edkpath ='edk2-standalone.project'
linuxpath ='linux-standalone.project'

filename='edk2-standalone.project'


def make_changes(original_path, additions, deletions):
    # Read the original file
    with open(original_path, 'r') as f:
        original_lines = f.readlines()

    # Make a copy to apply changes
    modified_lines = original_lines.copy()

    modified_lines.append('\n')
    modified_lines.append('\n')
    # Apply additions (just append here, but you can adjust to insert anywhere)
    for text in additions:
        modified_lines.append(text)

    # Sort deletions descending so deleting lines doesn't mess up indices
    for line_no in sorted(deletions, reverse=True):
        if 0 <= line_no < len(modified_lines):
            del modified_lines[line_no]
    
    f.close()

    with open(original_path, 'w') as ow:
        ow.writelines(modified_lines)
    
    ow.close()

    # Generate unified diff
    # diff = difflib.unified_diff(
    #     original_lines,
    #     modified_lines,
    #     fromfile='a/' + original_path,
    #     tofile='b/' + original_path,
    #     lineterm=''
    # )

    # # Return the diff as a string
    # patch_text = '\n'.join(diff)
    # return patch_text


# Example usage:
# additions = ["new line 1", "new line 2"]
# deletions = [1, 3]  # delete line 2 and line 4 (0-indexed)

# patch = generate_patch('example.txt', additions, deletions)
# print(patch)

additions = []
deletions = []


backup_edkpath = edkpath.replace('.project', '_backup.project')

backup_linuxpath = linuxpath.replace('.project', '_backup.project')


while True:
    print("Welcome to Static Analysis Configuration!")
    print("Chosen analysis file: " + filename)
    print("Pending additions: " + str(additions))
    print("Pending deletions: " + str(deletions))
    print("Choose one of the following options:")
    print("0. Choose analysis file to work with (Linux/EDK2)")
    print("1. Print the analysis file")
    print("2. Perform Entrypoint/Rule addition")
    print("3. Perform Entrypoint/Rule deletion in terms of line numbers")
    print("4. Commit changes")
    print("5. Flush pending changes")
    print("6. Restore the original files")
    print("7. Exit")

    userchoice = int(input())
    if userchoice==0:
        print("0.EDK2 analysis file")
        print("1.Linux analysis file")
        filechoice = int(input())
        if filechoice != 0 and filechoice != 1:
            print("Invalid choice!")
            break
        if filechoice == 0:
            filename = 'edk2-standalone.project'
        if filechoice == 1:
            filename = 'linux-standalone.project'
        print("Current Working File: "+filename)

    if userchoice==1:
        with open(filename,'r') as analysisfile:
            linenumber = 1
            for line in analysisfile:
                print(str(linenumber) + " " + line, end='')
                linenumber+=1
            print("")

    if userchoice==2:
        print("Provide the path to file location with new Entrypoints/Rules:")
        updatefile = input()
        try:
            with open(updatefile,'r') as ruleentryfile:
                for line in ruleentryfile:
                    additions.append(line)
        except FileNotFoundError:
            print(f"Error: File '{updatefile}' not found.")
        except IOError as e:
            print(f"I/O error while reading '{updatefile}': {e}")
        except Exception as e:
            print(f"Unexpected error while processing '{updatefile}': {e}")
        
    if userchoice==3:
        while True:
            print("Provide the line number to delete, once finished enter -1:")
            delnum = int(input()) - 1
            if delnum == -2:
                break
            deletions.append(delnum)

    # if userchoice==4:
    #     print("Pending additions:")
    #     print(additions)
    #     print("Pending deletions:")
    #     print(deletions)
    #     # patch = generate_patch(filename, additions, deletions)
    #     # print(patch)

    if userchoice==4:
        make_changes(filename, additions, deletions)
        additions.clear()
        deletions.clear()
        # if filename == 'edk2-standalone.project':
        #     patchfile = "edkpatch"
        # else:
        #     patchfile = "linuxpatch"
        # with open(patchfile,'w') as mypatch:
        #     mypatch.write(patch)

    if userchoice==5:
        additions.clear()
        deletions.clear()

    if userchoice==6:
        print("0.EDK2 analysis file")
        print("1.Linux analysis file")
        filechoice = int(input())
        if filechoice == 0:
            shutil.copyfile(backup_edkpath, edkpath)
            print(f"Backup restored: {edkpath}")
        if filechoice == 1:
            shutil.copyfile(backup_linuxpath, linuxpath)
            print(f"Backup restored: {linuxpath}")
               
    if userchoice==7:
        break
