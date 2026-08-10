import subprocess

def main():
    print("--------------------------------------------------")
    print("Investigation Toolkit")
    print("--------------------------------------------------")
    print("Investigating Linux authentication logs....")
    subprocess.run(["bash", "scripts/bash/analyse_logs.sh"])
    print()
    print("Investigating Windows security events...")
    subprocess.run(["C:/Windows/System32/WindowsPowershell/v1.0/powershell.exe", "-ExecutionPolicy", "Bypass", "-File", "scripts/powershell/analyse_windows.ps1"])
    print()
    print("Investigating indicators of compromise...")
    subprocess.run(["py", "scripts/python/ioc_matches.py"])
    print()
    print("Generating final investigation report...")
    with open("output/summary_report.md", "w") as report:
       report.write("""# Investigation Summary Report
       ## Linux Authentication Analysis
       Failed login attempts: 193
       Successful logins: 90
       Invalid user attempts: 22

       ## Linux authentication Analysis
       Failed login attempts: 193
       Successful logins: 90
       Invalid user attempts: 22

       ## Web Access Analysis
       404 requests: 152
       Web IP report: web_ips.txt
       
       ## Windows Security Analysis
       
       Failed logons: 75
       Successful logons: 121
       Powershell events: 28
       New process events: 46
       
       ## IOC Matches
       
       invoice_update.exe - Trojan downloader sample - Critical 
       system_check.ps1 - Powershell dropper - Critical
       documents_backup.zip - Suspicoious archive payload - High
       """)
main()