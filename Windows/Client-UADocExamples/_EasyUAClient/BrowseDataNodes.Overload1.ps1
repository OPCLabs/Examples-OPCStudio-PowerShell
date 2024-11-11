﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to obtain "data nodes" (objects, variables and properties) under the "Objects" node in the address
# space.
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .
# OPC client and subscriber examples in PowerShell on GitHub: https://github.com/OPCLabs/Examples-QuickOPC-PowerShell .
# Missing some example? Ask us for it on our Online Forums, https://www.opclabs.com/forum/index ! You do not have to own
# a commercial license in order to use Online Forums, and we reply to every post.

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.UA
using namespace OpcLabs.EasyOpc.UA.OperationModel

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcUA.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcUAComponents.dll"

[UAEndpointDescriptor]$endpointDescriptor =
    "opc.tcp://opcua.demo-this.com:51210/UA/SampleServer"
# or "http://opcua.demo-this.com:51211/UA/SampleServer" (currently not supported)
# or "https://opcua.demo-this.com:51212/UA/SampleServer/"

# Instantiate the client object.
$client = New-Object EasyUAClient

# Obtain data nodes under "Objects" node.
try {
    $nodeElementCollection = [IEasyUAClientExtension]::BrowseDataNodes($client, $endpointDescriptor)
}
catch [UAException] {
    Write-Host "*** Failure: $($PSItem.Exception.GetBaseException().Message)"
    return
}

# Display results
foreach ($nodeElement in $nodeElementCollection) {
    Write-Host
    Write-Host "nodeElement.DisplayName: $($nodeElement.DisplayName)"
    Write-Host "nodeElement.NodeId: $($nodeElement.NodeId)"
    Write-Host "nodeElement.NodeId.ExpandedText: $($nodeElement.NodeId.ExpandedText)"
}


# Example output:
#
#nodeElement.DisplayName: Server
#nodeElement.NodeId: Server
#nodeElement.NodeId.ExpandedText: nsu = http://opcfoundation.org/UA/ ;i=2253
#
#nodeElement.DisplayName: Data
#nodeElement.NodeId: nsu = http://test.org/UA/Data/ ;ns=2;i=10157
#nodeElement.NodeId.ExpandedText: nsu = http://test.org/UA/Data/ ;ns=2;i=10157
#
#nodeElement.DisplayName: Boilers
#nodeElement.NodeId: nsu = http://opcfoundation.org/UA/Boiler/ ;ns=4;i=1240
#nodeElement.NodeId.ExpandedText: nsu = http://opcfoundation.org/UA/Boiler/ ;ns=4;i=1240
#
#nodeElement.DisplayName: MemoryBuffers
#nodeElement.NodeId: nsu = http://samples.org/UA/memorybuffer ;ns=7;i=1025
#nodeElement.NodeId.ExpandedText: nsu = http://samples.org/UA/memorybuffer ;ns=7;i=1025

#endregion Example
