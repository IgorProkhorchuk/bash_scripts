[__script.sh__](/script.sh) - a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description. 
2. The `--all` key displays the IP addresses and symbolic names of all hosts in the current subnet. 
3. The `--target` key displays a list of open system TCP ports.

This script uses the `nmap` utility to perform network scans, so make sure that __nmap__ is installed on your system before running this script. When the script is run without any parameters, it will display a list of possible keys and their descriptions. 

[__apache_log.sh__](/apache_log.sh) - a script that show next:
1. From which ip were the most requests? 
2. What is the most requested page? 
3. How many requests were there from each ip? 
4. What non-existent pages were clients referred to? 
5. What time did site get the most requests? 
6. What search bots have accessed the site? (UA + IP)

This script uses `awk` and `grep` commands to extract and process the log data. Replace the value of _log_file_ with the name of your Apache log file.

[__backup.sh__](/backup.sh) -  a data backup script that takes the following data as parameters:
1. Path to the syncing  directory.
2. Path to the directory where the copies of the files will be stored.

In case of adding new or deleting old files, the script adds a corresponding entry to the log file indicating the time, type of operation and file name.

This script uses the `rsync` command to perform the backup, and the `grep` command to check for added or deleted files.
Replace the values of source_dir and backup_dir with the paths to the source directory and the backup directory, respectively. The script will create a log file (_backup.log_) that contains a record of the backup and any added or deleted files. The script will also add itself to the crontab with a run frequency of one minute, so it will be run automatically every minute to perform the backup.
