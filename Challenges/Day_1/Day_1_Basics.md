Welcome to Day 1 of the Bash Scripting Challenge! Today, we will cover the basics of bash scripting to get you started. Let's dive in:

## Task 1: Comments

In bash scripts, comments are used to add explanatory notes or disable certain lines of code. Your task is to create a bash script with comments explaining what the script does.

**ANSWER:** Comments section in programming languages show the documentation, dead the code, hint, dividing the code, disable the code, self documentation, referencing. Purpose Comments in any programing is same but our ajenda is related to **Bash_Scripting**
        1. #!/bin/bash It shows that this a Bash Script which tells the system how to execute.
        2. #This Progrogram prints the any text using echo command..It show the informationnor hint in program.

## Task 2: Echo

The `echo` command is used to display messages on the terminal. Your task is to create a bash script that uses `echo` to print a message of your choice.
**Answer:** **echo** **"**Hello!!Welcome to 7 Days Challenge of Bash Scripting**"**

## Task 3: Variables

Variables in bash are used to store data and can be referenced by their name. Your task is to create a bash script that declares variables and assigns values to them.
**Answer:** 
#!/bin/bash
va1="Hello"
var2="Kamran"

## Task 4: Using Variables

Now that you have declared variables, let's use them to perform a simple task. Create a bash script that takes two variables (numbers) as input and prints their sum using those variables.
**Answer:**
echo "$(var1) $(var2) !!Welcome to 7 Days Challenge of Bash Scripting "

## Task 5: Using Built-in Variables

Bash provides several built-in variables that hold useful information. Your task is to create a bash script that utilizes at least three different built-in variables to display relevant information.
**Answer:**
I will repeating the above of declaring the variables:
#!/bin/bash
# Get the current user's username
current_user="$USER"
# Get the current working directory
current_directory="$PWD"
# Get the number of arguments passed to the script
num_args="$#"
# Display the information using the built-in variables
echo "Current User: $current_user"
echo "Current Directory: $current_directory"
echo "Number of Arguments: $num_args"


## Task 6: Wildcards

Wildcards are special characters used to perform pattern matching when working with files. Your task is to create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.
**Answer:**
wildcard mask is not a built-in concept, but you can achieve similar functionality using glob patterns. Wildcard characters like * and ? are used to match files or directories with specific patterns. Here's how you can use wildcard masks in a Bash script:

Asterisk (*): The asterisk * is used to match any number of characters (including none) in a filename. For example, if you want to list all files in the current directory with a .txt extension, you can use *.txt as a wildcard mask.
# List all .txt files in the current directory
ls *.txt

**Question Mark (?):** The question mark ? is used to match any single character in a filename. For example, to list all files with a three-letter extension, you can use ???.*.
# List files with three-letter extensions
ls ???.*

**Brace Expansion:** You can use brace expansion to generate a list of values that match a pattern. For example, to create files named file1.txt, file2.txt, and file3.txt, you can use brace expansion like this:
touch file{1,2,3}.txt

**Character Class:** You can specify a character class inside square brackets to match any single character within that class. For example, [0-9] matches any single digit.
# List files with a single-digit number in the filename
ls file[0-9].txt

## Submission Instructions:

Create a single bash script that completes all the Tasks mentioned above. Add comments at appropriate places to explain what each part of the script does. Ensure that your script is well-documented and easy to understand.

To submit your entry, create a GitHub repository and commit your script to it.

Good luck with Day 1 of the Bash Scripting Challenge! Tomorrow, the difficulty will increase as we move on to more advanced concepts. Happy scripting!
