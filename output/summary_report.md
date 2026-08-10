# Investigation Summary Report
       ## Linux Authentication Analysis
       Failed login attempts: 193
       Successful logins: 90
       Invalid user attempts: 22
       
       ## Windows Security Analysis
       
       Failed logons: 75
       Successful logons: 121
       Powershell events: 28
       New process events: 46
       
       ## IOC Matches
       
       invoice_update.exe - Trojan downloader sample - Critical 
       system_check.ps1 - Powershell dropper - Critical
       documents_backup.zip - Suspicoious archive payload - High
       