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



case "$1" in
    "add") add_task "$2" ;;
    "show-todo") show_todo ;;
    "complete") complete_task "$2" ;;
    "show-done") show_done ;;
    "delete") delete_task "$2" ;;
    "show-deleted") show_deleted ;;
    "search") search "$2" "$3" ;;
    *) echo "Usage: $0 {add | show-todo | complete | show-done | delete | show-deleted | search}" ;;
esac

echo "Press any key to exit..."
read -n 1 -s -r
