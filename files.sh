#!/bin/bash

# Function to create folders and files
create_folders_and_files() {
    # Create bulkFolder if it doesn't exist
    if [ ! -d "bulkFolder" ]; then
        mkdir bulkFolder
    fi

    # Loop through each folder (a to z)
    for (( folder_name = 97; folder_name <= 122; folder_name++ )); do
        folder_path="bulkFolder/$(printf \\$(printf '%03o' $folder_name))"
        # Create folder if it doesn't exist
        if [ ! -d "$folder_path" ]; then
            mkdir "$folder_path"
        fi

        # Create 1000 files in each folder
        for (( file_count = 1; file_count <= 1000; file_count++ )); do
            file_name="$(printf \\$(printf '%03o' $folder_name))$file_count.pdf"
            file_path="$folder_path/$file_name"
            # Write content to file
            echo "This is part of folder $(printf \\$(printf '%03o' $folder_name)) and file $file_count" > "$file_path"
            echo "This is the content of file $(printf \\$(printf '%03o' $folder_name))$file_count" >> "$file_path"
        done
    done
}

# Main function
main() {
    create_folders_and_files
    echo "Folders and files created successfully."
}

# Run main function
main
