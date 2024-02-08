import os
import shutil

def copy_files(src_folder, exclude_files, exclude_folders):
    files_to_copy = []
    for root, dirs, files in os.walk(src_folder):
        # Exclude specific folders
        dirs[:] = [d for d in dirs if os.path.join(root, d) not in exclude_folders]
        for file in files:
            if file not in exclude_files and os.path.join(root, file) not in exclude_folders:
                file_path = os.path.join(root, file)
                files_to_copy.append(file_path)
    return files_to_copy

def paste_files(target_folders, files_to_copy, src_folder):
    for folder in target_folders:
        exclude_folder_path = os.path.join(folder, "Townsound")  # Define the path to the Townsound folder to exclude it
        for file in files_to_copy:
            relative_path = os.path.relpath(file, src_folder)
            target_path = os.path.join(folder, relative_path)
            if exclude_folder_path not in target_path:  # Check if the target path is not within the Townsound folder
                os.makedirs(os.path.dirname(target_path), exist_ok=True)
                shutil.copy(file, target_path)
                print(f"Copied {file} to {target_path}")

def main():
    current_directory = os.path.dirname(os.path.realpath(__file__))
    x_missions_path = os.path.join(current_directory, "x_missions")

    # Files and folders to exclude
    exclude_files = {"mission.sqm", os.path.basename(__file__)}
    exclude_folders = {x_missions_path}

    # Copying files
    files_to_copy = copy_files(current_directory, exclude_files, exclude_folders)
    print(f"Number of files to be copied: {len(files_to_copy)}")

    # Getting all folders inside x_missions
    target_folders = [os.path.join(x_missions_path, d) for d in os.listdir(x_missions_path) if os.path.isdir(os.path.join(x_missions_path, d))]

    # Pasting files
    paste_files(target_folders, files_to_copy, current_directory)
    print("Copying complete.")

if __name__ == "__main__":
    main()
