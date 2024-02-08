import os
import shutil

# Global array variables
EXCLUDED_FILES = {"mission.sqm", os.path.basename(__file__)}
EXCLUDED_FOLDERS = {"Townsound"}  # Townsound is now included in EXCLUDED_FOLDERS by default
PATH_TO_COPY = "x_missions"  # Global variable for x_missions path

def copy_files(src_folder):
    global EXCLUDED_FILES, EXCLUDED_FOLDERS
    files_to_copy = []
    for root, dirs, files in os.walk(src_folder):
        # Exclude specific folders
        dirs[:] = [d for d in dirs if os.path.join(root, d) not in EXCLUDED_FOLDERS]
        for file in files:
            if file not in EXCLUDED_FILES and os.path.join(root, file) not in EXCLUDED_FOLDERS:
                file_path = os.path.join(root, file)
                files_to_copy.append(file_path)
    return files_to_copy

def paste_files(target_folders, files_to_copy, src_folder):
    global EXCLUDED_FOLDERS
    for folder in target_folders:
        for exclude_folder in EXCLUDED_FOLDERS:
            exclude_folder_path = os.path.join(folder, exclude_folder)  # Define the path to the excluded folders
            for file in files_to_copy:
                relative_path = os.path.relpath(file, src_folder)
                target_path = os.path.join(folder, relative_path)
                if exclude_folder_path not in target_path:  # Check if the target path is not within the excluded folders
                    os.makedirs(os.path.dirname(target_path), exist_ok=True)
                    shutil.copy(file, target_path)
                    print(f"Copied {file} to {target_path}")

def main():
    current_directory = os.path.dirname(os.path.realpath(__file__))
    x_missions_path = os.path.join(current_directory, PATH_TO_COPY)

    # Update global variables
    global EXCLUDED_FILES, EXCLUDED_FOLDERS
    EXCLUDED_FOLDERS.add(x_missions_path)
    # Townsound is already included in EXCLUDED_FOLDERS, so no need to add it again here

    # Copying files
    files_to_copy = copy_files(current_directory)
    print(f"Number of files to be copied: {len(files_to_copy)}")

    # Getting all folders inside x_missions
    target_folders = [os.path.join(x_missions_path, d) for d in os.listdir(x_missions_path) if os.path.isdir(os.path.join(x_missions_path, d))]

    # Pasting files
    paste_files(target_folders, files_to_copy, current_directory)
    print("Copying complete.")

if __name__ == "__main__":
    main()
