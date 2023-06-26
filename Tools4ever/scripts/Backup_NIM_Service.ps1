$ErrorActionPreference = "Stop"

$backupPath = Read-Host -Prompt "Directory path to drop backup [Default: C:\Tools4ever\backups]"
if ([string]::IsNullOrWhiteSpace($backupPath)) {
	    $backupPath = "C:\Tools4ever\backups"
    }

Write-Output ""
Write-Output "Getting Service paths from registry...`n"
$NimService = (Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\NIM -Name ImagePath).ImagePath -replace '"'
$NimData = (Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\NIM\Config -Name workingPath).workingPath -replace '"'

$serviceStop = Read-Host -Prompt "Stop NIM Service? [Default: Y]"
if([string]::IsNullOrWhiteSpace($serviceStop) -or $serviceStop.ToLower() -eq 'y') {
    try {
        Write-Output "Stopping NIM Service"
        Stop-Service NIM
        
        } catch{}

    $timestamp = Get-Date -Format "yyyyMMdd_hhmmss"

    $backupFile ="$($backupPath)\ProgramFiles.$($timestamp).zip"
    Write-Output "Starting Service Backup to [$($backupFile)]"
    Compress-Archive -Path (Get-Item -Path $NimService).DirectoryName -CompressionLevel "Fastest" -DestinationPath $backupFile

    $backupFile ="$($backupPath)\ProgramData.$($timestamp).zip"
    Write-Output "Starting Config Backup to [$($backupFile)]"
    Compress-Archive -Path $NimData -CompressionLevel "Fastest" -DestinationPath $backupFile
}

$serviceStart = Read-Host -Prompt "Start NIM Service? [Default: Y]"
if([string]::IsNullOrWhiteSpace($serviceStart) -or $serviceStart.ToLower() -eq 'y') {
    Start-Service NIM
}
