import csv

suspicious_files = []
iocs = []

with open("dataset/suspicious_files.csv", newline="") as file:
    reader = csv.DictReader(file)
    suspicious_files = list(reader)

with open("dataset/ioc_list.csv", newline="") as file:
    reader = csv.DictReader(file)
    iocs = list(reader)

output_file = open("output/ioc_matches.csv", "w", newline="")
writer = csv.writer(output_file)

writer.writerow(["file_name", "sha256", "threat_label", "severity"])

for file in suspicious_files:
    file_hash = file["sha256"]

    for ioc in iocs:
        if ioc["ioc_type"] == "sha256" and file_hash == ioc["ioc_value"]:
            print("IOC MATCH FOUND")
            print("File:", file["file_name"])
            print("Hash:", file_hash)
            print("Threat:", ioc["threat_label"])
            print("Severity:", ioc["severity"])
            print()

            writer.writerow([
                file["file_name"],
                file_hash,
                ioc["threat_label"],
                ioc["severity"]
            ])
output_file.close()