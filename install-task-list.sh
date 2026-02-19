#!/bin/bash

echo "Installing Keena's first task manager..."
echo "Keena says, HI!"

echo ""

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

