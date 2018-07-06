<# Custom Script for Windows to install Cylance from Azure Storage using the staging folder created by the deployment script #>

$source = https://maliek.blob.core.windows.net/cylance/CylanceProtect_x64.msi
$dest = "C:\WindowsAzure"
New-Item -Path $dest -ItemType directory
Invoke-WebRequest $source -OutFile "$dest\CylanceProtect_x64.msi"

<# Install Cylance using script for msi install #>
Start-Process msiexec.exe -Wait -ArgumentList '/I C:\WindowsAzure\CylanceProtect_x64.msi /qn PIDKEY=NqmzcgoemZ0Whl7JMzDWzA3oE'