#!/bin/bash

# Function to display usage information and available options
function display_usage {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create     Create a new user account."
    echo "  -d, --delete     Delete an existing user account."
    echo "  -r, --reset      Reset password for an existing user account."
    echo "  -l, --list       List all user accounts on the system."
    echo "  -h, --help       Display this help and exit."
    echo "    Additional Features:"
    echo "   -i, --info  : Display user details"
    echo "   -m, --modify: Modify user properties"
}

function create_user {
     read -p "Enter the new username: " username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "Username $username already exists. Please choose a different username."
        exit 1
        
    else
    read -s -p "Enter the password for $username: " password

    # Create the user with the provided username and password
    useradd -m "$username" #To create a user with a home directory and set a password, you would use them like this: -m -p

    echo "$username:$password" | chpasswd

    echo "User $username created successfully."
    
    fi
}

function delete_user {
read -p "Enter the username to delete: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        userdel -r "$username"  # Delete the user and their home directory
        echo "User account '$username' has been deleted."
    else
        echo "User account '$username' does not exist."
    fi
}

function reset_password {
    read -p "Enter the username to reset password: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        # Prompt for password (Note: You might want to use 'read -s' to hide the password input)
        read -p "Enter the new password for $username: " password

        # Set the new password
        echo "$username:$password" | chpasswd
        echo "Password for user '$username' reset successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}

function list_users {
    echo "User accounts on the system:"
    cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
}

# Check if no arguments are provided or if the -h or --help option is given
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    display_usage
    exit 0
fi

function display_user_details {
    read -p "Enter the username to display details: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        echo "User Details for '$username':"
        finger "$username"
    else
        echo "User account '$username' does not exist."
    fi
}

# Function to modify user properties
function modify_user {
    read -p "Enter the username to modify: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        # Provide options for modifying user properties (e.g., username, user ID)
        read -p "Enter the new username: " new_username
        # Additional modification logic can be added here

        usermod -l "$new_username" "$username"  # Modify the username
        echo "User account '$username' has been renamed to '$new_username'."
    else
        echo "User account '$username' does not exist."
    fi
}
# Command-line argument parsing
while [ $# -gt 0 ]; do
    case "$1" in
        -c|--create)
            create_user
            ;;
        -d|--delete)
            delete_user
            ;;
        -r|--reset)
            reset_password
            ;;
        -l|--list)
            list_users
            ;;
        -i|--info)
            display_user_details
            ;;
        -m|--modify)
            modify_user
            ;;  
        *)
            echo "Error: Invalid option '$1'. Use '--help' to see available options."
            exit 1
            ;;
    esac
    shift
done
