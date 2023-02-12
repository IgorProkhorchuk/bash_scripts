[__script.sh__](/script.sh) - a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description. 
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet. 
3. The --target key displays a list of open system TCP ports.The code that performs the functionality of each of the subtasks must be placed in a separate function.

This script uses the nmap utility to perform network scans, so make sure that nmap is installed on your system before running this script. When the script is run without any parameters, it will display a list of possible keys and their descriptions. The --all key will display the IP addresses and symbolic names of all hosts in the current subnet, and the --target key will display a list of open system TCP ports. The code for each of these functions has been placed in separate functions to make the script easier to maintain and modify in the future.

[__apache_log.sh__](/apache_log.sh) - a script that answers on the following questions:
1. From which ip were the most requests? 
2. What is the most requested page? 
3. How many requests were there from each ip? 
4. What non-existent pages were clients referred to? 
5. What time did site get the most requests? 
6. What search bots have accessed the site? (UA + IP)

This script uses awk and grep commands to extract and process the log data. Replace the value of log_file with the name of your Apache log file. The script will output the answers to each of the questions you listed.

[__backup.sh__](/backup.sh) -  a data backup script that takes the following data as parameters:1. Path to the syncing  directory.2. The path to the directory where the copies of the files will be stored.In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]

This script uses the rsync command to perform the backup, and the grep command to check for added or deleted files. Replace the values of source_dir and backup_dir with the paths to the source directory and the backup directory, respectively. The script will create a log file (backup.log) that contains a record of the backup and any added or deleted files. The script will also add itself to the crontab with a run frequency of one minute, so it will be run automatically every minute to perform the backup.