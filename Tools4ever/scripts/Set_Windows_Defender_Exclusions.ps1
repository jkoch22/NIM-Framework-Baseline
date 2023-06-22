$NimService = (Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\NIM -Name ImagePath).ImagePath -replace '"'
$NimData = (Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\NIM\Config -Name workingPath).workingPath -replace '"'

Add-MpPreference -ExclusionPath "$((Get-Item -Path $NimService).DirectoryName)"
Add-MpPreference -ExclusionPath "$($NimService)"
Add-MpPreference -ExclusionPath "$((Get-Item -Path $NimService).DirectoryName)\node.exe"
Add-MpPreference -ExclusionPath "$($NimData)"