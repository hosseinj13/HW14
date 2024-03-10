#!/bin/bash

todo_file="todo.txt"
done_file="done.txt"
deleted_file="deleted.txt"

touch $todo_file $done_file $deleted_file

add_task() {
    echo "Enter new task: "
    read new_task
    echo "$new_task" >> $todo_file
}

show_todo() {
    echo "Tasks to do: "
    cat $todo_file
}

complete_task() {
    echo "Enter the task to mark as completed:"
    read task
    grep -v "$task" $todo_file > temp && mv temp $todo_file
    echo "$task" >> $done_file
}

show_done() {
    echo "Completed tasks:"
    cat $done_file
}

delete_task() {
    echo "Enter the task to delete:"
    read task
    grep -v "$task" $done_file > temp && mv temp $done_file
    echo "$task" >> $deleted_file
}


show_deleted() {
    echo "Deleted tasks:"
    cat $deleted_file
}

search() {
    echo "Enter keyword to search:"
    read keyword
    echo "Searching in $1:"
    result=$(grep "$keyword" $1)
    if [ -z "$result" ]; then
        echo "No results found."
    else
        echo "$result"
    fi
}



PS3="Please select an option: "
options=("Add tasks" "Show tasks todo" "Complete task" "Show done tasks" "Delete task" "Show deleted task" "Search" "Quit")
select opt in "${options[@]}"; do
    case $opt in
       "Add tasks")
          add_task
            ;;
        "Show tasks todo")
          show_todo
            ;;
        "Complete task")
          complete_task
            ;;
        "Show done tasks")
          show_done
            ;;
        "Delete task")
          delete_task
            ;;
        "Show deleted task")
          show_deleted
            ;;
        "Search")
          search
            ;;
        "Quit")
          break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
