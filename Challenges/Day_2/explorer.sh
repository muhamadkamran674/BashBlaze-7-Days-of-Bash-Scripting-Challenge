#Using While Loop Method

#!/bin/bash
#Part 1
echo "Welcome to the File and Directory Explorer Script!"
while true; do
    # List files and directories with their names and sizes
    echo "Contents of the current directory:"
    ls -lh

    # Prompt the user for input
    read -p "Enter the name of a file or directory to explore || Enter a line of text (Press Enter without text to exit): " choice

    #It checks if the user's input ($choice) is equal to "exit." If the user enters "exit," the script displays a farewell message 
    #and exits the loop using the break statement.

    if [ "$choice" == "exit" ]; then
        echo "Exiting the File Explorer. Goodbye!"
        break
        
    #If the input is not "exit" and the choice exists in the current directory (as determined by the -e condition), it proceeds to further checks.      
    elif [ -e "$choice" ]; then
    #If the choice is a directory (as determined by the -d condition), it changes into that directory using the cd command.
        if [ -d "$choice" ]; then
            echo "Exploring directory: $choice"
            cd "$choice" || exit 1  # Change directory, exit on failure
    #If the choice is a file (as determined by the -f condition), it shows/read view of text using cat command.
        elif [ -f "$choice" ]; then
            echo "Displaying file: $choice"
    #cat command is used to display the contents of text file
            cat "$choice"  # Display file content (you can change this part as needed)
        else
            echo "Invalid choice. Please enter a valid file or directory name."
        fi
    else
    #Part 2 Counting Words or Characyter
        if [ -z "$choice" ]; then
            echo "Empty input detected. Exiting text input mode."
        else
            # Count the number of characters in the user's input
            char_count=$(echo -n "$choice" | wc -m)
            echo "Character count: $char_count"
        fi
    fi
done




#Using case Statement
#!/bin/bash

echo "Welcome to the File and Directory Explorer Script!"
while true; do
    # List files and directories with their names and sizes
    echo "Contents of the current directory:"
    ls -lh

    # Prompt the user to choose an option
    echo "Select an option:"
    echo "1. Explore a file or directory"
    echo "2. Enter text"
    echo "3. Exit"
    read -p "Enter your choice (1/2/3): " option

    case "$option" in
        1)
            read -p "Enter the name of a file or directory to explore: " choice
            if [ "$choice" == "exit" ]; then
                echo "Exiting the File Explorer. Goodbye!"
                break
            elif [ -e "$choice" ]; then
                if [ -d "$choice" ]; then
                    echo "Exploring directory: $choice"
                    cd "$choice" || exit 1  # Change directory, exit on failure
                elif [ -f "$choice" ]; then
                    echo "Displaying file: $choice"
                    cat "$choice"  # Display file content (you can change this part as needed)
                else
                    echo "Invalid choice. Please enter a valid file or directory name."
                fi
            else
                echo "File or directory not found. Please enter a valid name."
            fi
            ;;
        2)
            echo "Enter text (press Enter on an empty line to exit text input mode):"
            while true; do
                read text
                #-z is used to check if the user's input string ($text) is empty. When the user enters an empty line 
                #(just presses Enter without typing any text), the condition -z "$text" becomes true, and the script exits the text input mode.
                if [ -z "$text" ]; then
                    echo "Exiting text input mode."
                    break
                else
                    char_count=$(echo -n "$text" | wc -c)
                    echo "Character count: $char_count"
                fi
            done
            ;;
        3)
            echo "Exiting the File Explorer. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done


