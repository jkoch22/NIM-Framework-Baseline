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
		Write-Host Downloading latest release
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
	Copy-Item -Recurse -Path "$($sourcePath)\Tools4ever\*" -Destination $path -Force

# Clean Up Installation files
	Remove-Item $tempPath -Recurse -Force -Confirm:$false

# Copy Schema files
	Write-Output "Installing schema files..."
	Copy-Item -Recurse -Path "$($path)\_source\ProgramData\Tools4ever\NIM\config\rest\" -Destination "$($installationPath)" -Force

# Copy Images
    Write-Output "Installing extra image files..."
    Copy-Item -Recurse -Path "$($path)\_source\ProgramData\Tools4ever\NIM\config\images\" -Destination "$($installationPath)" -Force

# Configure Memory Settings
    Write-Output ""
    $input = Read-Host -Prompt "Configure Memory Settings for Service? [Default: Y]"
    if($input -ne 'N') {
        Write-Output "Configuring Memory Settings for Service..."
        Invoke-Command {reg import "$($path)\scripts\Set_NIM_Memory_16gb.reg" *>&1 | Out-Null}    
    }

# Update Service Settings
Write-Output ""
    $input = Read-Host -Prompt "Update Service Settings? [Default: Y]"
    if($input -ne 'N') {
        Write-Output "Configuring Service Settings ..."
        $jsonFilePath = "$($installationPath)\settings.json"
        
        # Check if the JSON file exists, if not, create it with default content
        if (-Not (Test-Path -Path $jsonFilePath)) {
            $defaultContent = @{
                mfa = "Optional"
                worker_thread_auditing_query_max = 10
                worker_thread_auditing_storage = $true
            }
            $defaultContent | ConvertTo-Json -Depth 32 | Set-Content -Path $jsonFilePath -Force
        } else {
            # Read the JSON file
            $jsonContent = Get-Content -Path $jsonFilePath -Raw | ConvertFrom-Json

            # Update the "mfa" property to "Optional", if it doesn't exist, add it
            if ($null -eq $jsonContent.mfa) {
                $jsonContent | Add-Member -MemberType NoteProperty -Name "mfa" -Value "Optional"
            } else {
                $jsonContent.mfa = "Optional"
            }

            # Update the "worker_thread_auditing_query_max" property to 10, if it doesn't exist, add it
            if ($null -eq $jsonContent.worker_thread_auditing_query_max) {
                $jsonContent | Add-Member -MemberType NoteProperty -Name "worker_thread_auditing_query_max" -Value 10
            } else {
                $jsonContent.worker_thread_auditing_query_max = 10
            }

            # Update the "worker_thread_auditing_storage" property to true, if it doesn't exist, add it
            if ($null -eq $jsonContent.worker_thread_auditing_storage) {
                $jsonContent | Add-Member -MemberType NoteProperty -Name "worker_thread_auditing_storage" -Value $true
            } else {
                $jsonContent.worker_thread_auditing_storage = $true
            }

            # Convert the updated content back to JSON format
            $jsonContent | ConvertTo-Json -Depth 32 | Set-Content -Path $jsonFilePath -Force
        }
    }


# Setup Windows Defender
    $input = Read-Host -Prompt "Configure Windows Defender Exclusions? [Default: Y]"
    if($input -ne 'N') {
        Write-Output "Configuring Windows Defender...`n"
        & "$($path)\scripts\Set_Windows_Defender_Exclusions.ps1"
    }

# Setup Windows Firewall
    $input = Read-Host -Prompt "Configure Windows Firewall Rules? [Default: Y]"
    if($input -ne 'N') {
        # Define rule names
        $ruleNames = @("Tools4ever_NIM_Allow_HTTP", "Tools4ever_NIM_Allow_HTTPS")

        # Define ports
        $ports = @(80, 443)

        # Loop through the ports and rule names

        for ($i = 0; $i -lt $ports.Count; $i++) {
            $ruleName = $ruleNames[$i]
            $port = $ports[$i]

            # Check if the rule already exists
            if (-not (Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue)) {
                New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Action Allow -Protocol TCP -LocalPort $port | Out-Null
                Write-Output "`nFirewall rule '$($ruleName)' for TCP port $($port) added."
            } else {
                Write-Output "`nFirewall rule '$($ruleName)' for TCP port $($port) already exists."
            }
        }
}

# Install AD Tools
	$input = Read-Host -Prompt "Configure AD Tools? [Default: Y]"
    if($input -ne 'N')
    {
        Write-Output "Configuring AD Tools...`n"
        & "$($path)\scripts\Install_AD_Tools.ps1"
    }
    
Write-Output "`nInstallation Completed"