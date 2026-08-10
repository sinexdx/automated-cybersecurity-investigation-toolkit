#!/bin/bash
echo "-------------------------------------------"
echo "Linux Authenticatoin Log analysis"
echo "-------------------------------------------"

failedlogins(){
    echo ""
    echo "Analysing authentication logs...."

    grep "Failed password" dataset/auth.log > output/failedlogins.txt

    failed_count=$(wc -l < output/failedlogins.txt)
    
    echo "Total failed login attempts: $failed_count "
    echo "Failed login report created and saved to output/failedlogins.txt"
}
failedlogins

successful_logins(){
    echo ""
    echo "Analysing successful logins...."
    grep "Accepted publickey" dataset/auth.log > output/successful_logins.txt
    successful_count=$(wc -l < output/successful_logins.txt)
    echo "Total successful login attempts: $successful_count"
    echo "Successful login report created and saved to output/successful_logins.txt"
}
successful_logins

invalid_users(){
    echo ""
    echo "Analysing for invalid users...."
    grep "Invalid user" dataset/auth.log > output/invalid_users.txt
    iu_count=$(wc -l < output/invalid_users.txt)
    echo "Total invalid users: $iu_count"
    echo "Invalid users report created and saved to output/invalid_users.txt"
}
invalid_users

top_ips(){
        echo "" 
    echo "Analysing top attacking IP addresses..."
    awk '/Failed password for invalid user/ {print $13} /Failed password for/ && !/invalid user/ {print $11}' output/failedlogins.txt | sort | uniq -c | sort -nr > output/top_ips.txt
    echo "Top attacking IP report created and saved to output/top_ips.txt"
}
top_ips

targeted_users(){
    echo ""
    echo "Analysing targeted usernames..."
    awk '/Failed password for invalid user/ {print $11} /Failed password for/ && !/invalid user/ {print $9}' output/failedlogins.txt | sort | uniq -c | sort -nr > output/targeted_users.txt
    echo " Targeted usernames reports created and saved to output/targeted_users.txt"
}
targeted_users

access_logs(){
    echo ""
    echo "Analysing web access logs..."
    grep "404" dataset/access.log > output/404_requests.txt
    failed_requests=$(wc -l < output/404_requests.txt)
    echo "Total 404 requests: $failed_requests"
    echo "404 request report created and saved to output/404_requests.txt"
    awk '{print $1}' dataset/access.log | sort | uniq -c | sort -nr > output/web_ips.txt
    echo "Web IP report created and saved to output/web_ips.txt"
}
access_logs

summary(){
    echo ""
    echo "-------------------------------------------------------------"
    echo "Analysis Summary"
    echo "-------------------------------------------------------------"
    echo "Failed login attempts: $failed_count"
    echo " Successful login attempts: $successful_count"
    echo "Invalid user attempts: $iu_count"
    echo "404 requests: $failed_requests"
    echo ""
    echo "Reports generated:"
    echo "----------------------------"
    echo "- failedlogins.txt"
    echo "- successful_logins.txt"
    echo "- invalid_users.txt"
    echo "- top_ips.txt"
    echo "- targeted_users.txt"
    echo "- 404_requests.txt"
    echo "- web_ips.txt"

}
summary

