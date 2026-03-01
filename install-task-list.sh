#!/bin/bash

echo "Installing Keena's first task manager..."
echo "Keena says, HI!"

echo ""

OLD_TASK_FILE="$HOME/.tasks.txt"
TASK_DIR="$HOME/.config/task_for_bash"
TASK_FILE="$HOME/.config/task_for_bash/.tasks.txt"

# --- VERSION 2.0 MIGRATION BLOCK ---
if [[ -f "$OLD_TASK_FILE" ]]; then
    mkdir -p "$TASK_DIR"
    
    if [[ -f "$TASK_FILE" ]]; then
        # If both exist, append old tasks to the new file to avoid data loss
        cat "$OLD_TASK_FILE" >> "$TASK_FILE"
        rm "$OLD_TASK_FILE"
        echo "Notice: Merged your old tasks into $TASK_FILE \n"
    else
        # Otherwise, just do a normal move
        mv "$OLD_TASK_FILE" "$TASK_FILE"
        echo "Notice: Migrated your tasks file to $TASK_FILE \n"
    fi
fi
# -----------------------

mkdir -p ~/.keena-scripts

rm -f ~/.keena-scripts/task

curl -sSL https://raw.githubusercontent.com/k334a/keena-task-for-bash/main/task -o ~/.keena-scripts/task

chmod +x ~/.keena-scripts/task

# Try to add to PATH
if [[ ":$PATH:" != *":$HOME/.keena-scripts:"* ]]; then
    echo 'export PATH="$HOME/.keena-scripts:$PATH"' >> ~/.bashrc
    echo "Added ~/.keena-scripts to PATH."
    echo ""
    echo "Restart terminal or run: source ~/.bashrc to apply changes"
    echo ""
fi

echo "Installation was a success."
echo "Your first task looks like: task \"my first task!\" l"
echo "Run task list to view your tasks."

