#!/bin/bash

# Emoji dictionary
declare -A emoji
emoji["Add"]="⭐"
emoji["Refactor"]="⚻"
emoji["Configure"]="⚙"
emoji["Remove"]="💥"
emoji["Test"]="🧪"
emoji["Optimize"]="🚀"
emoji["Document"]="📄"
emoji["Fix"]="🪲"
emoji["Style"]="🎨"
emoji["Celebrate"]="🎉"

# Prompt for Action
read -p "Enter Action (h for help): " action

# If help, show help and exit
if [[ "$action" == "h" ]]; then
    echo "Add       (a)  - ${emoji["Add"]} Add a new file"
    echo "Refactor  (r)  - ${emoji["Refactor"]} Refactor existing code"
    echo "Configure (c)  - ${emoji["Configure"]} Configure a setting"
    echo "Remove    (rm) - ${emoji["Remove"]} Remove a file or setting"
    echo "Test      (t)  - ${emoji["Test"]} Add or update tests"
    echo "Optimize  (o)  - ${emoji["Optimize"]} Optimize code"
    echo "Document  (d)  - ${emoji["Document"]} Add or update documentation"
    echo "Fix       (f)  - ${emoji["Fix"]} Fix a bug"
    echo "Style     (s)  - ${emoji["Style"]} Update style"
    echo "Celebrate (cl) - ${emoji["Celebrate"]} Celebrate a milestone"
    read -p "Enter Action: " action
fi

# Switch action to full name
case $action in
    "a") action="Add" ;;
    "r") action="Refactor" ;;
    "c") action="Configure" ;;
    "rm") action="Remove" ;;
    "t") action="Test" ;;
    "o") action="Optimize" ;;
    "d") action="Document" ;;
    "f") action="Fix" ;;
    "s") action="Style" ;;
    "cl") action="Celebrate" ;;
esac

# Check if action is valid
emojiAction=${emoji[$action]}
if [ -z "$emojiAction" ]; then
    echo "Invalid action '$action'."
    exit 1
fi

# Prompt for Scope
read -p "Enter Scope: " scope

# Prompt for Message
read -p "Enter Message: " message

# If no action or scope, exit
if [ -z "$action" ] || [ -z "$scope" ]; then
    echo "No action or scope provided."
    exit 1
fi

# If no message, prompt for message
if [ -z "$message" ]; then
    read -p "No message included. Do you want to continue without a message? (y/n): " confirm
    while [[ "$confirm" != "y" ]] && [[ "$confirm" != "n" ]]; do
        read -p "Do you want to continue without a message? (y/n): " confirm
    done

    if [ "$confirm" != "y" ]; then
        read -p "Enter Message: " message
        commitMessage="$emojiAction ${scope}: $message"
    else
        commitMessage="$emojiAction ${scope}"
    fi
else
    commitMessage="$emojiAction ${scope}: $message"
fi

# Prompt for confirmation
read -p "Commit? ($commitMessage) (y/n): " confirm
while [[ "$confirm" != "y" ]] && [[ "$confirm" != "n" ]]; do
    read -p "Commit? (y/n): " confirm
done

# If n, exit
if [ "$confirm" != "y" ]; then
    exit 1
fi

# Commit using Git
git commit -m "$commitMessage"
