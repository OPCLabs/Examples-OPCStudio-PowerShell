﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to obtain information about OPC UA servers from the Global Discovery Server (GDS).
# The result is flat, i.e. each discovery URL is returned in separate element, with possible repetition of the servers.
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

# Obtain collection of application elements.
try {
    $discoveryElementCollection = [IEasyUAClientExtension]::DiscoverGlobalServers($client,
        "opc.tcp://opcua.demo-this.com:58810/GlobalDiscoveryServer")
}
catch [UAException] {
    Write-Host "*** Failure: $($PSItem.Exception.GetBaseException().Message)"
    return
}

# Display results.
foreach ($discoveryElement in $discoveryElementCollection) {
    Write-Host
    Write-Host "Server name: $($discoveryElement.ServerName)"
    Write-Host "Discovery URI string: $($discoveryElement.DiscoveryUriString)"
    Write-Host "Server capabilities: $($discoveryElement.ServerCapabilities)"
}


# Example output:
#

#endregion Example
