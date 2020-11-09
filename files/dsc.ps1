configuration IE_Disable_Security {
    Import-DSCResource -Module xSystemSecurity -Name xIEEsc 
    Node localhost {
        xIEEsc DisableIEEscUsers 
        { 
            IsEnabled = $false 
            UserRole = "Users" 
        }
        xIEEsc DisableIEEscAdministrators 
        { 
            IsEnabled = $false 
            UserRole = "Administrators" 
        }
    }
}

IE_Disable_Security

Start-DscConfiguration -Path .\IE_Disable_Security -wait -verbose -force