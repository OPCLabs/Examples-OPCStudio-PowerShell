﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to write data (a value, timestamps and status code) into a single attribute of a node.
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

Write-Host "Modifying data of a node's attribute..."
try {
    $client.Write($endpointDescriptor, "nsu=http://test.org/UA/Data/ ;i=10221", 
        (New-Object UAAttributeData(12345, [UASeverity]::GoodOrSuccess, [DateTime]::UtcNow)))

    # The target server may not support this, and in such case a failure will occur.
}
catch [UAException] {
    Write-Host "*** Failure: $($PSItem.Exception.GetBaseException().Message)"
    return
}

Write-Host "Finished."

#endregion Example