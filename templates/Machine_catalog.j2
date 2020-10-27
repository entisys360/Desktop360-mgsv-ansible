$VerbosePreference = "Continue"


function Create-NewCatalog {
    param(
        $Zonename,
        $domain,
        $machineCatalogName ,
        $machineCatalogDesc,
        $orgUnit,
        $namingScheme = "W8-MCS-###",
        $namingSchemeType = "Numeric",
        $allocType = "Random",
        $persistChanges = "Discard",
        $provType = "MCS",
        $sessionSupport = "MultiSession",
        $SnapshotRGName,
        $SnapShotName,
        $VMSize = "Standard_B2ms",
        $LocationID = "bd48f857-7091-4afc-b2ad-f70e96a22a43",
        $MinimumFunctionalLevel = "L7_20",
        $IdentityPoolName = "",
        $AzureVMSize,
        $AdminUserName,
        $AdminPassword,
        $HostingConnectionName,
        $VDICount,
        $HostingUnitName,
        $VDIResourceGroupName,
        $NetworkResourceGroupName,
        $VnetName,
        $SubnetName
        $CustomerID = {{ CustomerID }}
        $Secrets = {{ Secrets }}
        $ApiKey = {{ ApiKey }} 

    )


    $snapinName = 'Citrix.Broker.Admin.V2';
    if ($null -eq (Get-PSSnapin -Name $snapinName -ErrorAction SilentlyContinue))  {

        Add-PSSnapin -Name $snapinName -ErrorAction Stop;

    }
    Set-XDCredentials -CustomerId $CustomerID -ProfileType CloudToken -APIKey $ApiKey -SecretKey $Secrets 
    # Create a Machine Catalog. In this case a catalog with randomly assigned desktops
    Write-Verbose "Creating machine catalog. Name: $machineCatalogName; Description: $machineCatalogDesc; Allocation: $allocType"

    $CatalogParam = @{
        Name = $machineCatalogName 
        ProvisioningType =  $provType 
        MinimumFunctionalLevel = $MinimumFunctionalLevel 
        AllocationType = $allocType 
        PersistUserChanges = $persistChanges 
        SessionSupport = $sessionSupport 
        ZoneUid =  $(Get-ConfigZone | where {$_.Name -eq $ZoneName}).Uid.Guid
    }

    New-BrokerCatalog @CatalogParam
    
    
    # The identity pool is used to store AD machine accounts
    Write-Verbose "Creating a new identity pool for machine accounts."
    if((Get-AcctIdentityPool -IdentityPoolName $CatalogParam.Name) -eq $null) {

        $identPoolParam = @{
            Domain =  $domain 
            IdentityPoolName = $machineCatalogName 
            NamingScheme = $namingScheme 
            NamingSchemeType = $namingSchemeType 
            OU = $orgUnit
            ZoneUid =  $(Get-ConfigZone | where {$_.Name -eq $ZoneName}).Uid.Guid
        }

        $identPool = New-AcctIdentityPool @identPoolParam 

        #if((-not (Get-AcctADAccount -IdentityPoolName $identPool.IdentityPoolName)) -or (-not (Get-AcctADAccount -IdentityPoolName $identPool.IdentityPoolName).State -ne "InUse")){
            
        #    New-AcctADAccount -IdentityPoolName $identPool.IdentityPoolName -Count $VDICount -ADUserName $AdminUserName -ADPassword $AdminPassword 

        #}

    }
      
    
    # Creates/Updates metadata key-value pairs for the catalog
    Write-Verbose "Retrieving the newly created machine catalog."
    $catalogUid = Get-BrokerCatalog | Where-Object { $_.Name -eq $machineCatalogName } | Select-Object Uid
    $guid = [guid]::NewGuid()
    
    
    Write-Verbose "Updating metadata key-value pairs for the catalog."
    Set-BrokerCatalogMetadata -CatalogId $catalogUid.Uid -Name 'Citrix_DesktopStudio_IdentityPoolUid' -Value $guid   
    
    # Check to see whether a provisioning scheme is already available
    Write-Verbose "Checking whether the provisioning scheme name is unused."
    
    If (Test-ProvSchemeNameAvailable -AdminAddress $adminAddress -ProvisioningSchemeName @($machineCatalogName)){
        
        $hostingUnit = Get-ChildItem "XDHyp:\HostingUnits" | Where-Object { $_.PSChildName -like $HostingUnitName } | Select-Object PSChildName, PsPath

        #Custom Property for ProvScheme
        $CustomProperties = @"
<CustomProperties xmlns="http://schemas.citrix.com/2014/xd/machinecreation" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><Property xsi:type="StringProperty" Name="UseManagedDisks" 
Value="true" /><Property xsi:type="StringProperty" Name="StorageAccountType" Value="Premium_LRS" /><Property xsi:type="StringProperty" Name="ResourceGroups" Value="$VDIResourceGroupName" /><Property 
xsi:type="StringProperty" Name="LicenseType" Value="Windows_Server" /></CustomProperties>
"@
        $provSchemeParam = @{
            ProvisioningSchemeName = $machineCatalogName
            HostingUnitName = $hostingUnit.PSChildName
            MasterImageVM = "XDHyp:\HostingUnits\$($hostingUnit.PSChildName)\image.folder\$SnapshotRGName.resourcegroup\$SnapShotName.snapshot"
            CleanOnBoot = $true
            IdentityPoolName = $identPool.IdentityPoolName 
            TenancyType = "Shared"
            CustomProperties = $CustomProperties
            RunAsynchronously = $true
            ServiceOffering = "XDHyp:\HostingUnits\$($hostingUnit.PSChildName)\serviceoffering.folderserviceoffering.folder\$VMSize.serviceoffering"
            NetworkMapping = @{"0"="XDHyp:\HostingUnits\$($hostingUnit.PSChildName)\virtualprivatecloud.folder\$NetworkResourceGroupName.resourcegroup\$VnetName.virtualprivatecloud\$SubnetName.network"}
            Scope = @()
        }
        
        $provTaskId = New-ProvScheme @provSchemeParam 

        $provTask = Get-ProvTask -TaskId $provTaskId
        
        While ( $provTask.Active -eq $True ) {


            Try { 
                $totalPercent = If ( $provTask.TaskProgress ) { 
                
                                    $provTask.TaskProgress 
                                } 
                                Else {
                                    0
                                } 
            } 
            
            Catch {
        
            }

            Write-Progress -Activity "Creating Provisioning Scheme (copying and composing master image):" -Status "$totalPercent% Complete:" -percentcomplete $totalPercent
            Sleep 15
            $provTask = Get-ProvTask -AdminAddress $adminAddress -TaskID $provTaskId
        }


        # If provisioning task fails, there's no point in continuing further.
        If ( $provTask.WorkflowStatus -eq "Completed" ) {
         
            # Apply the provisioning scheme to the machine catalog
            Write-Verbose "Binding provisioning scheme to the new machine catalog"
            $provScheme = Get-ProvScheme | Where-Object { $_.ProvisioningSchemeName -eq $machineCatalogName }
            Set-BrokerCatalog -Name $provScheme.ProvisioningSchemeName -ProvisioningSchemeId $provScheme.ProvisioningSchemeUid

            

            # Provisiong the actual machines and map them to AD accounts, track the progress while this is happening
            Write-Verbose "Creating the machine accounts in AD."
            $adAccounts = New-AcctADAccount -IdentityPoolName $identPool.IdentityPoolName -Count $VDICount -ADUserName $AdminUserName -ADPassword $AdminPassword 
            Write-Verbose "Creating the virtual machines."
            $provTaskId = New-ProvVM -ADAccountName @($adAccounts.SuccessfulAccounts) -ProvisioningSchemeName $provScheme.ProvisioningSchemeName -RunAsynchronously
            $provTask = Get-ProvTask -TaskId $provTaskId

            Write-Verbose "Tracking progress of the machine creation task."
            $totalPercent = 0
            While ( $provTask.Active -eq $True ) {
                Try { 
                    $totalPercent = If ( $provTask.TaskProgress ) { 
                                        $provTask.TaskProgress 
                                    }
                                    Else {
                                        0
                                    }
                }
                Catch { 
                
                }

                Write-Progress -Activity "Creating Virtual Machines:" -Status "$totalPercent% Complete:" -percentcomplete $totalPercent
                Sleep 15
                $ProvTask = Get-ProvTask -AdminAddress $adminAddress -TaskID $provTaskId
            }

            # Assign the newly created virtual machines to the machine catalog
            $provVMs = Get-ProvVM -AdminAddress $adminAddress -ProvisioningSchemeUid $provScheme.ProvisioningSchemeUid
            Write-Verbose "Assigning the virtual machines to the new machine catalog."
            ForEach ( $provVM in $provVMs ) {

                Write-Verbose "Locking VM $provVM.ADAccountName"
                Lock-ProvVM -ProvisioningSchemeName $provScheme.ProvisioningSchemeName -Tag 'Brokered' -VMID @($provVM.VMId)


                Write-Verbose "Adding VM $provVM.ADAccountName"
                New-BrokerMachine  -CatalogUid $catalogUid.Uid -MachineName $provVM.ADAccountName
            }
            Write-Verbose "Machine catalog creation complete."

        }
        else {
            # If provisioning task fails, provide error
            # Check that the hypervisor management and storage resources do no have errors. Run 'Test Connection', 'Test Resources' in Citrix Studio
            Write-Error "Provisioning task failed with error: [$provTask.TaskState] $provTask.TerminatingError"
        }
        
    }
    
        
}


$inputParams = @{
    Zonename = {{ Zonename }}
    domain = {{ domain }}
    machineCatalogName  = {{ machineCatalogName }}
    machineCatalogDesc = {{ machineCatalogDesc }}
    orgUnit = {{ orgUnit }}
    namingScheme = {{ namingScheme }}
    namingSchemeType = {{ namingSchemeType }}
    allocType = {{ allocType }}
    persistChanges = {{ persistChanges }}
    provType = {{ provType }}
    sessionSupport = {{ sessionSupport }}
    SnapshotRGName = {{ SnapshotRGName }}
    SnapShotName = {{ SnapShotName }}
    VMSize = {{ VMSize }}
    LocationID = {{ LocationID }}
    MinimumFunctionalLevel = {{ MinimumFunctionalLevel }}
    AdminUserName = {{ AdminUserName }}
    AdminPassword = {{ AdminPassword }}
    VDICount = {{ VDICount }}
    HostingUnitName = {{ HostingUnitName }}
    VDIResourceGroupName = {{ VDIResourceGroupName }}
    NetworkResourceGroupName = {{ NetworkResourceGroupName }}
    VnetName = {{ VnetName }}
    SubnetName = {{ SubnetName }}
}


Create-NewCatalog @inputParams
