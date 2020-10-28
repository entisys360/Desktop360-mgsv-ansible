# Install the packages required

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force 
 
Install-Module Az.Storage -Force

Install-Module Xendesktop7 -Scope AllUsers -Verbose -Force
 
 
# Storage account name and Container name
 
$ContainerName = "bin"
 
 
# Give the connection string.
 
$ConnectionString = "DefaultEndpointsProtocol=https;AccountName=vsanjivaiah;AccountKey=r4ds/NEmL1XtXeAZc4YUwcoL4QKOFwFcIim/a+iv3xRbakQx8QYGAgS51R/GZ/x7HNhOBAIZLxMv4kPnK1vJOQ==;EndpointSuffix=core.windows.net"
 
$Ctx = New-AzStorageContext -ConnectionString $ConnectionString
 
 


#Destination Path
 if (-not (Test-Path "c:\Temp\x64")) {
     New-Item -ItemType Directory -Path c:\Temp\x64 -Verbose
    
 }
$localTargetDirectory = "C:\Temp\x64"
 
 
#Download Blob to the Destination Path
Get-AzStorageBlobContent -Blob "XenDesktopVdaSetup.exe" -Container $ContainerName -Destination $localTargetDirectory -Context $ctx -Force -Verbose
