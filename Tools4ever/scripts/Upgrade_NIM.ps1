$ErrorActionPreference = "Stop"

Write-Output "Starting NIM Upgrade"
    $installerPath = Read-Host -Prompt "Path of NIM Installer?"
    Write-Output ""

    if ([string]::IsNullOrWhiteSpace($installerPath) -or $installerPath.length -lt 1) {
        Write-Error "Installer path must be specified"
    }

	$NimService = (Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\NIM -Name ImagePath).ImagePath -replace '"'
	$NimData = (Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\NIM\Config -Name workingPath).workingPath -replace '"'

# Prompt for path input
    $path = Read-Host -Prompt "Path of Tools4ever Directory [Default: C:\Tools4ever]"
    Write-Output ""

    if ([string]::IsNullOrWhiteSpace($path)) {
	    $path = "C:\Tools4ever"
    }

# Backup Service
    & "$($path)\scripts\Backup_NIM_Service.ps1"

# Install NIM
    & $installerPath

Write-Output "`n Upgrade Started"