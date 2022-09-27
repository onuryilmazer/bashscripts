# bashscripts
Repo of my bash scripts that I created for learning purposes.

```
Readme file created using:
ls *.sh | xargs -I "%" /bin/bash -c "echo %; awk '/# Description/, /^[\s]*$/ {print \$0}';" > README.md



00_backup_script.sh
# Description
# Creates a backup of the user's home directory in the current working directory.

01_valid_path.sh
# Description
# Checks if the given paths are valid and whether if they point to directories or files.

02_random_guess.sh
# Description
# Asks the user to guess a random number between 1 and 10 (both inclusive) until they get it right.

03_numbered_cat.sh
# Description
# Prints all given files into stdout and numbers each line.

04_abspath.sh
# Description
# Prints the absolute path for every relative path given as arguments.

05_batchtext.sh
# Description
# Changes the extensions of given files, if they actually exist. Supports wildcards.

06_listdl.sh
# Description
# Takes a list of URL's as a text file and downloads them into the given directory using wget.

07_demux.sh
# Description
# Demultiplexer that takes a list of RNA sequences and sorts them into different files using the provided marker information. Check the files 7_marker_list.txt and 7_seq_data.txt to see the expected input format.

08_sedwrapper.sh
# Description
# Wrapper for sed that replaces a word with the given substitution. Default behavior is changing the first occurence in each line, unless the option -g is used.

09_sed_head.sh
# Description
# Uses the sed command to imitate the functionality of the head command. The -n parameter of head is also implemented.

10_sed_tail.sh
# Description
# Uses the sed command to imitate the functionality of the tail command. Counts the nr of lines using wc (which is rather hacky) and then uses sed on the correct range of lines. The -n parameter of tail is also implemented.

11_matrixer.sh
# Description
# Uses awk to create a matrix from a text file and label each entry with their respective coordinates in the matrix. Demonstration:
# This    Is          ->       1,1: This      1,2: Is
# An    Example                2,1: An        2,2: Example

12_slicer.sh
# Description
# Uses awk to handle a formatted text file as a matrix and extract a certain part of it according to given matrix coordinates. 3x3 matrix usage demonstration:
# 23  1     0         2-3, 2-3 slice:         1337    7
# 42  1337  7                                 0       69
# 0   0     69
```
