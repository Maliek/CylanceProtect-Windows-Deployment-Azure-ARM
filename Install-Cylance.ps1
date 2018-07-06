<# Custom Script for Windows to install Cylance from Azure Storage using the staging folder created by the deployment script #>
param (
    [string]$artifactsLocation,
    [string]$artifactsLocationSasToken,
    [string]$folderName,
    [string]$fileToInstall
)

$source = $artifactsLocation + "\$folderName\$fileToInstall" + $artifactsLocationSasToken
$dest = "C:\WindowsAzure\$folderName"
New-Item -Path $dest -ItemType directory
Invoke-WebRequest $source -OutFile "$dest\$fileToInstall"

<# Install Cylance using script for msi install #>
Start-Process msiexec.exe -Wait -ArgumentList '/i C:\WindowsAzure\CylanceProtect_x64.msi /qn PIDKEY=XXXXXXXXXXXXXXXXXXXXXXXX'