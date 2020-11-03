Configuration baseline_svc {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node "localhost" {
        #Disabling Application Layer Gateway service
        Service ALG
        {
            Name        = "ALG"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Background Intelligent Transfer service
        Service BITS
        {
            Name        = "BITS"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Bitlocker Drive Encryption service
        Service BDESVC
        {
            Name        = "BDESVC"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Block Level Backup Engine service
        Service wbengine
        {
            Name        = "wbengine"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Bluetooth Handsfree service
        Service BthHFSrv
        {
            Name        = "BthHFSrv"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Bluetooth Support service
        Service bthserv
        {
            Name        = "bthserv"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Branche Cache service
        Service PeerDistSvc
        {
            Name        = "PeerDistSvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
         #Disabling Computer Browser service
        Service Browser
        {
            Name        = "Browser"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Device Association Service
        Service DeviceAssociationService
        {
            Name        = "DeviceAssociationService"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Diagnostic Policy service
        Service DPS
        {
            Name        = "DPS"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Diagnostic service Host service
        Service WdiServiceHost
        {
            Name        = "WdiServiceHost"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Diagnostic System Host service
        Service WdiSystemHost
        {
            Name        = "WdiSystemHost"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Encrypting File System service
        Service EFS
        {
            Name        = "EFS"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Fax service
        Service Fax
        {
            Name        = "Fax"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Function Discovery Provider Host service
        Service fdPHost
        {
            Name        = "fdPHost"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Function Discovery Resource Publication service
        Service FDResPub
        {
            Name        = "FDResPub"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Home Group Listener service
        Service HomeGroupListener
        {
            Name        = "HomeGroupListener"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Internet Connection Sharing (ICS) service
        Service SharedAccess
        {
            Name        = "SharedAccess"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Infrared Monitoring service
        Service irmon
        {
            Name        = "irmon"
            StartupType = "Disabled"
            State       = "Stopped"
        }
         #Disabling Offline Files service
         Service CscService
        {
            Name        = "CscService"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Optimize drives service
        Service defragsvc
        {
            Name        = "defragsvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Retail Demo service
        Service RetailDemo
        {
            Name        = "RetailDemo"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Security service
        Service wscsvc
        {
            Name        = "wscsvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Sensor Monitoring service
        Service SensrSvc
        {
            Name        = "SensrSvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Shell Hardware Detection service
        Service ShellHWDetection
        {
            Name        = "ShellHWDetection"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling SSDP Discovery service
        Service SSDPSRV
        {
            Name        = "SSDPSRV"
            StartupType = "Disabled"
            State       = "Stopped"
        }
         #Disabling Superfetch service
         Service SysMain
        {
            Name        = "SysMain"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Themes service
        Service Themes
        {
            Name        = "Themes"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling UPnP Device Host service
        Service upnphost
        {
            Name        = "upnphost"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Windows Connect Now - Config Registrar service
        Service wcncsvc
        {
            Name        = "wcncsvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Windows Error Reporting service
        Service WerSvc
        {
            Name        = "WerSvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Windows Media Player Network Sharing service
        Service WMPNetworkSvc
        {
            Name        = "WMPNetworkSvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Windows Mobile Hotspot service
        Service icssvc
        {
            Name        = "icssvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Windows Search
        Service WSearch
        {
            Name        = "WSearch"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling WLAN AutoConfig service
        Service WlanSvc
        {
            Name        = "WlanSvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling WWAN AutoConfig service
        Service WwanSvc
        {
            Name        = "WwanSvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Xbox Live Auth Manager service
        Service XblAuthManager
        {
            Name        = "XblAuthManager"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Xbox Live Game Save service
        Service XblGameSave
        {
            Name        = "XblGameSave"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Xbox Live Networking dsc_xservice service
        Service XboxNetApiSvc
        {
            Name        = "XboxNetApiSvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
        #Disabling Indexing Service
        Service cisvc
        {
            Name        = "cisvc"
            StartupType = "Disabled"
            State       = "Stopped"
        }
    }
}

baseline_svc

Start-DscConfiguration  -Path .\baseline_svc -ComputerName localhost -Verbose -Wait -Force


