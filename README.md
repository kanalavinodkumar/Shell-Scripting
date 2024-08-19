# Shell-Scripting

Shell scripting involves using various commands to automate tasks, manipulate files, and interact with the operating system. Here are some of the most frequently used commands in shell scripting:

### 1. **`echo`**
   - Used to print text or variables to the terminal or a file.
   - Example: 
     ```bash
     echo "Hello, World!"
     echo "Value of VAR is $VAR"
     ```

### 2. **`read`**
   - Used to take input from the user.
   - Example:
     ```bash
     read -p "Enter your name: " name
     echo "Hello, $name!"
     ```

### 3. **`if`, `else`, `elif`**
   - Conditional statements used to execute code based on a condition.
   - Example:
     ```bash
     if [ $VAR -eq 10 ]; then
       echo "VAR is 10"
     elif [ $VAR -lt 10 ]; then
       echo "VAR is less than 10"
     else
       echo "VAR is greater than 10"
     fi
     ```

### 4. **`for`, `while`, `until`**
   - Loop constructs used to repeat commands.
   - Example (`for` loop):
     ```bash
     for i in 1 2 3 4 5; do
       echo "Iteration $i"
     done
     ```
   - Example (`while` loop):
     ```bash
     while [ $VAR -lt 10 ]; do
       echo "VAR is $VAR"
       VAR=$((VAR + 1))
     done
     ```
   - Example (`until` loop):
     ```bash
     until [ $VAR -ge 10 ]; do
       echo "VAR is $VAR"
       VAR=$((VAR + 1))
     done
     ```

### 5. **`case`**
   - Used for pattern matching, similar to a switch statement in other languages.
   - Example:
     ```bash
     case $VAR in
       1)
         echo "VAR is 1"
         ;;
       2)
         echo "VAR is 2"
         ;;
       *)
         echo "VAR is something else"
         ;;
     esac
     ```

### 6. **`grep`**
   - Searches for patterns within files or output.
   - Example:
     ```bash
     grep "pattern" filename
     ```

### 7. **`awk`**
   - A powerful text processing tool, often used for pattern scanning and processing.
   - Example:
     ```bash
     awk '{print $1}' filename  # Prints the first column of each line
     ```

### 8. **`sed`**
   - A stream editor used for text substitution, filtering, and transformations.
   - Example:
     ```bash
     sed 's/oldtext/newtext/g' filename
     ```

### 9. **`cut`**
   - Used to extract sections from each line of input, typically used for parsing data.
   - Example:
     ```bash
     cut -d':' -f1 /etc/passwd  # Extracts the first field from each line, using ':' as a delimiter
     ```

### 10. **`sort`**
   - Sorts lines of text files.
   - Example:
     ```bash
     sort filename
     ```

### 11. **`uniq`**
   - Filters out or reports repeated lines in a file (often used after `sort`).
   - Example:
     ```bash
     sort filename | uniq
     ```

### 12. **`tr`**
   - Translates or deletes characters.
   - Example:
     ```bash
     echo "hello" | tr 'a-z' 'A-Z'
     ```

### 13. **`xargs`**
   - Constructs argument lists and executes commands based on input from standard input.
   - Example:
     ```bash
     find . -name "*.log" | xargs rm
     ```

### 14. **`touch`**
   - Creates an empty file or updates the timestamp of an existing file.
   - Example:
     ```bash
     touch newfile.txt
     ```

### 15. **`mkdir`**
   - Creates directories.
   - Example:
     ```bash
     mkdir new_directory
     ```

### 16. **`rm`**
   - Removes files or directories.
   - Example:
     ```bash
     rm filename
     rm -r directory  # Recursively remove a directory
     ```

### 17. **`cp`**
   - Copies files or directories.
   - Example:
     ```bash
     cp sourcefile destinationfile
     cp -r sourcedir destinationdir  # Copy directories recursively
     ```

### 18. **`mv`**
   - Moves or renames files or directories.
   - Example:
     ```bash
     mv oldname newname
     mv sourcedir destinationdir
     ```

### 19. **`chmod`**
   - Changes file permissions.
   - Example:
     ```bash
     chmod 755 script.sh
     ```

### 20. **`chown`**
   - Changes the owner of a file or directory.
   - Example:
     ```bash
     chown user:group filename
     ```

### 21. **`find`**
   - Searches for files and directories based on various criteria.
   - Example:
     ```bash
     find /path -name "filename"
     ```

### 22. **`tar`**
   - Archives files into a single file, often used with compression.
   - Example:
     ```bash
     tar -czvf archive.tar.gz directory/
     ```

### 23. **`ps`**
   - Displays information about currently running processes.
   - Example:
     ```bash
     ps aux | grep processname
     ```

### 24. **`kill`**
   - Sends signals to processes, typically used to terminate them.
   - Example:
     ```bash
     kill -9 PID
     ```

### 25. **`exit`**
   - Exits the script and returns a status code.
   - Example:
     ```bash
     exit 0  # Successful exit
     exit 1  # Indicate an error
     ```
### To execute shell script in debug mode use -x in first line like below 

#!/bin/sh -x 

### to get ip addresses from logfile use the below command 

grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" logfile | sort | uniq -c | sort -nr
These commands form the foundation of shell scripting and can be combined in various ways to automate complex tasks.

##The command you've provided is used to extract the name of the current working directory from its full path. 
      
      ```bash
      
      vinod@jenkins-20240819-033351:~$ pwd
      /home/vinod
      
      pwd | rev | cut -d "/" -f 1 | rev
      vinod
     ```
