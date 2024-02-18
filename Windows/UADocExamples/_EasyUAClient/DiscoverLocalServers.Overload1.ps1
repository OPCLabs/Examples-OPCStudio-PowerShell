﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to obtain application URLs of all OPC Unified Architecture servers on a given machine.
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.UA
using namespace OpcLabs.EasyOpc.UA.Discovery
using namespace OpcLabs.EasyOpc.UA.OperationModel

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcUA.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcUAComponents.dll"

# Instantiate the client object.
$client = New-Object EasyUAClient

# Obtain collection of server elements.
try {
    $discoveryElementCollection = [IEasyUAClientExtension]::DiscoverLocalServers($client, "opcua.demo-this.com")
}
catch [UAException] {
    Write-Host "*** Failure: $($PSItem.Exception.GetBaseException().Message)"
    return
}

# Display results.
foreach ($discoveryElement in $discoveryElementCollection) {
    Write-Host "discoveryElementCollection[`"$($discoveryElement.DiscoveryUriString)`"].ApplicationUriString: $($discoveryElement.ApplicationUriString)"
}


# Example output:
#
#discoveryElementCollection["opc.tcp://opcua.demo-this.com:51210/UA/SampleServer"].ApplicationUriString: urn:DEMO-5:UA Sample Server
#discoveryElementCollection["http://opcua.demo-this.com:51211/UA/SampleServer"].ApplicationUriString: urn:DEMO-5:UA Sample Server
#discoveryElementCollection["https://opcua.demo-this.com:51212/UA/SampleServer/"].ApplicationUriString: urn:DEMO-5:UA Sample Server
#discoveryElementCollection["http://opcua.demo-this.com:62543/Quickstarts/AlarmConditionServer"].ApplicationUriString: urn:opcua.demo-this.com:Quickstart Alarm Condition Server
#discoveryElementCollection["opc.tcp://opcua.demo-this.com:62544/Quickstarts/AlarmConditionServer"].ApplicationUriString: urn:opcua.demo-this.com:Quickstart Alarm Condition Server

#endregion Example
