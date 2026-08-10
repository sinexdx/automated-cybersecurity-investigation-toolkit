# Advanced Scripting for Cybersecurity - Simulated Project Dataset

This dataset is provided for the repeat project. It is fully simulated and is intended for scripting, log analysis, IOC matching, and investigation reporting practice.

## Scenario

A small organisation suspects that one of its systems may have been targeted by suspicious login attempts and possible malicious activity. You have been asked to use scripting to analyse the available evidence and produce a short investigation report.

## Files

- auth.log
  Simulated Linux SSH authentication log. It contains successful logins, failed logins, invalid users, and repeated login attempts.

- access.log
  Simulated web server access log in a common Apache-style format. It contains normal web requests and suspicious probing activity.

- windows_events.csv
  Simulated Windows security event data. It contains login events, process creation events, service installation events, and other security-relevant records.

- suspicious_files.csv
  Simulated file metadata collected from Windows hosts. It contains file paths, extensions, sizes, SHA256 hashes, creation times, and owners.

- ioc_list.csv
  Simulated threat intelligence list. It contains IP addresses, domains, and SHA256 hashes that may be matched against the other files.

## Notes

All data in this folder is simulated. The IP addresses, domains, hashes, usernames, hostnames, and events are for educational use only.

Students should write scripts to analyse the dataset. Possible tasks include extracting failed login attempts, identifying repeated suspicious IP addresses, summarising web status codes, matching indicators against the IOC list, identifying suspicious files, and generating an investigation report.

Students must not run attacks, scans, or tests against real systems. This project is based on offline analysis of the provided simulated data.
