Write-Host "--------------------------------------------"
Write-Host "Windows Security Event Analysis"
Write-Host "--------------------------------------------"

$events = Import-Csv "dataset/windows_events.csv"
$failedCount = 0
$successfulCount = 0
$powershellCount = 0
$newProcessesCount = 0

function failed_logons{
    Write-Host ""
    Write-Host "Analysing failed Windows logons..."
    $failed = $events | Where-Object { $_.event_id -eq "4625"}
    $script:failedCount = $failed.Count
    Write-Host "Total failed logons: $failedCount"
}
failed_logons

function successful_logons{
    Write-Host ""
    Write-Host "Analysing successful Windows logons..."
    $successful = $events | Where-Object { $_.event_id -eq "4624"}
    $script:successfulCount = $successful.Count
    Write-Host "Total successful logons: $successfulCount"
}
successful_logons

function powershell_activity{
    Write-Host ""
    Write-Host "Analysing Powershell Acitivity..."
    $powershell = $events | Where-Object {$_.process -eq "powershell.exe"}
    $script:powershellCount = $powershell.Count
    Write-Host "Total Powershell events: $powershellCount"
}
powershell_activity

function new_processes{
    Write-Host ""
    Write-Host "Analysing new process creation..."
    $newProcesses = $events | Where-Object {$_.event_id -eq "4688"}
    $script:newProcessesCount = $newProcesses.Count
    Write-Host "Total new process events: $newProcessesCount"
}
new_processes

function summary{
    Write-Host ""
    Write-Host "--------------------------------------------"
    Write-Host "Windows security Analysis Summary"
    Write-Host "--------------------------------------------"
    Write-Host "Successful logons: $successfulCount"
    Write-Host "Failed logons: $failedCount"
    Write-Host "Powershell events: $powershellCount"
    Write-Host "New process events: $newProcessesCount"

}
summary 

