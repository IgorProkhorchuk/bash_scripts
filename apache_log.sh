#!/bin/bash

# This script analyzes Apache log data

# The log file to analyze
log_file="access.log"

# Question 1: From which IP were the most requests?
echo "1. From which IP were the most requests?"
awk '{print $1}' $log_file | sort | uniq -c | sort -nr | head -1

# Question 2: What is the most requested page?
echo "2. What is the most requested page?"
awk '{print $7}' $log_file | sort | uniq -c | sort -nr | head -1

# Question 3: How many requests were there from each IP?
echo "3. How many requests were there from each IP?"
awk '{print $1}' $log_file | sort | uniq -c | sort -nr

# Question 4: What non-existent pages were clients referred to?
echo "4. What non-existent pages were clients referred to?"
grep " 404 " $log_file | awk '{print $7}' | sort | uniq -c | sort -nr

# Question 5: What time did the site get the most requests?
echo "5. What time did the site get the most requests?"
awk '{print $4}' $log_file | cut -d ':' -f 2 | sort | uniq -c | sort -nr | head -1

# Question 6: What search bots have accessed the site? (UA + IP)
echo "6. What search bots have accessed the site? (UA + IP)"
grep -E 'Googlebot|Bingbot|YandexBot|BaiduBot|Sogou web spider' $log_file | awk '{print $1, $12}' | sort | uniq -c | sort -nr
