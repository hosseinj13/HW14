#!/bin/bash

create_files() {
    for i in {1..5}; do
        touch "file_$i.txt"
        echo "File $i created."
    done
}

add_text() {
    for file in file_*.txt; do
        echo "Hello world" >> "$file"
        echo "Text added to $file."
    done
}

replace_text() {
    for file in file_*.txt; do
        sed -i 's/world/bash/g' "$file"
        echo "Text replaced in $file."
    done
}


PS3="Please select an option: "
options=("Create files" "Add text" "Replace text" "Quit")
select opt in "${options[@]}"; do
    case $opt in
        "Create files")
            create_files
            ;;
        "Add text")
            add_text
            ;;
        "Replace text")
            replace_text
            ;;
        "Quit")
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
