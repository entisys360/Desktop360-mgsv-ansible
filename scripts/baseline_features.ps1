Configuration baseline_features {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node localhost {
        #Remove SMB 1.0/CIFS File Sharing Support
        WindowsOptionalFeature SMB1Protocol {
            Ensure = "Disable"
            Name = "SMB1Protocol"
            NoWindowsUpdateCheck = $true
        }
        #Remove WorkFolders-Client
        WindowsOptionalFeature WorkFolders-Client {
            Ensure = "Disable"
            Name = "WorkFolders-Client"
            NoWindowsUpdateCheck = $true
        }
        #Remove Printing-XPSServices-Features
        WindowsOptionalFeature Printing-XPSServices-Features {
            Ensure = "Disable"
            Name = "Printing-XPSServices-Features"
            NoWindowsUpdateCheck = $true
        }
        #Remove Printing-Foundation-InternetPrinting-Client
        WindowsOptionalFeature Printing-Foundation-InternetPrinting-Client {
            Ensure = "Disable"
            Name = "Printing-Foundation-InternetPrinting-Client"
            NoWindowsUpdateCheck = $true
        }
        #Remove FaxServicesClientPackage
        WindowsOptionalFeature FaxServicesClientPackage {
            Ensure = "Disable"
            Name = "FaxServicesClientPackage"
            NoWindowsUpdateCheck = $true
        }
    }
    
}
baseline_features

Start-DscConfiguration  -Path .\baseline_features -ComputerName localhost -Verbose -Wait -Force