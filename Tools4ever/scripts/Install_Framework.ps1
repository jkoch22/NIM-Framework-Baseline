Write-Output "Starting Framework installation"
# Prompt for path input
    $path = Read-Host -Prompt "Path of Tools4ever Directory [Default: C:\Tools4ever]"
    Write-Output ""
    
    $installationPath = Read-Host -Prompt "Path of NIM Config Directory [Default: C:\ProgramData\Tools4ever\NIM\config]"
    Write-Output ""

    if ([string]::IsNullOrWhiteSpace($path)) {
	    $path = "C:\Tools4ever"
    }

    if ([string]::IsNullOrWhiteSpace($installationPath)) {
	    $installationPath = "C:\ProgramData\Tools4ever\NIM\config"
}

# Setup Installation path
$tempPath = "$($path)\temp"
Write-Output "Creating temp path [$($tempPath)]"
New-Item $tempPath -ItemType Directory -Force >$null 2>&1

# Download Framework
try {
    $repo = "Tools4ever-NIM/NIM-Framework-Baseline"
    
    $releases = "https://api.github.com/repos/$($repo)/releases"

    Write-Output "Determining latest release"
    $download = (Invoke-WebRequest $releases -UseBasicParsing | ConvertFrom-Json)[0].zipball_url
    $name = "NIM-Framework-Baseline"
    $zip = "$($name).zip"
    $dir = "$name"
	$downloadPath = "$($tempPath)\$($dir)"
    $dumpFile = "$($downloadPath)\$($zip)"
	New-Item $downloadPath -ItemType Directory -Force >$null 2>&1
    Write-Host Dowloading latest release
    Invoke-WebRequest $download -Out $dumpFile

	$expandPath = "$($tempPath)\_installation"
    Write-Output "Extracting [$($dumpFile)] release files to [$($expandPath)]"
    Expand-Archive $dumpFile -DestinationPath $expandPath -Force
} catch {
    Write-Error "Failed to download release"
    $_
    break
}

# Get Sub Folder
	$sourcePath = (Get-ChildItem $expandPath -Directory -Force)[0].FullName
	Copy-Item -Recurse -Path "$($sourcePath)\Tools4ever\*" -Destination $path -Force -Verbose

# Clean Up Installation files
	Remove-Item $tempPath -Recurse -Force -Confirm:$false

# Copy Schema files
	Write-Output "Installing schema files..."
	Copy-Item -Recurse -Path "$($path)\_source\ProgramData\Tools4ever\NIM\config\rest\" -Destination "$($installationPath)" -Force -Verbose

# Copy Images
    Write-Output "Installing extra image files..."
    Copy-Item -Recurse -Path "$($path)\_source\ProgramData\Tools4ever\NIM\config\images\" -Destination "$($installationPath)" -Force -Verbose

# Setup Windows Defender
    $input = Read-Host -Prompt "Configure Windows Defender Exclusions? [Default: Y]"
    if($input -ne 'N')
    {
        Write-Output "Configuring Windows Defender...`n"
        & "$($path)\scripts\Set_Windows_Defender_Exclusions.ps1"
    }

# Configure Memory Settings
    Write-Output ""
    $input = Read-Host -Prompt "Configure Memory Settings for Service? [Default: Y]"
    if($input -ne 'N')
    {
        Write-Output "Configuring Memory Settings for Service..."
        Invoke-Command {reg import "$($path)\scripts\Set_NIM_Memory_16gb.reg" *>&1 | Out-Null}    
    }

Write-Output "`nInstallation Completed"