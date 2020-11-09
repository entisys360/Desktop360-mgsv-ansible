Configuration XD7VDAFeature {
    Import-DscResource -ModuleName XenDesktop7
    Node "localhost" {
        XD7VDAFeature XD7DeskopVDAFeature {
            Role = 'DesktopVDA'
            SourcePath = 'C:\Temp'
            InstallReceiver = $true
            Optimize = $true
        }
        XD7VDAController XD7VDAController1 {
            Name = 'dc01.e360labs.local'
        }
    }
}

XD7VDAFeature

Start-DscConfiguration  -Path .\XD7VDAFeature -ComputerName localhost -Verbose -Wait -Force