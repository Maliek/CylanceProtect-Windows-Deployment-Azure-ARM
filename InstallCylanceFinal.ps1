Configuration InstallCylanceFinal
{
	Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
	
	Script Test
	{
		SetScript = 
		{
			$source = "https://maliek.blob.core.windows.net/cylance/CylanceProtect_x64.msi"
			$dest = "C:\WindowsAzure"
			New-Item -Path $dest -ItemType directory
			Invoke-WebRequest $source -OutFile "$dest\CylanceProtect_x64.msi"
			Start-Process msiexec.exe -Wait -ArgumentList '/i C:\WindowsAzure\CylanceProtect_x64.msi /qn PIDKEY=NqmzcgoemZ0Whl7JMzDWzA3oE'
		}
		TestScript = { Test-Path "C:\WindowsAzure\CylanceProtect_x64.msi" }
        GetScript = { @{ Result = (Get-Content C:\WindowsAzure\CylanceProtect_x64.msi) } }
	}
}
