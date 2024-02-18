﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to change the sampling rate of an existing monitored item subscription.
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

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

# Data change notification handler
Register-ObjectEvent -InputObject $client -EventName DataChangeNotification -Action { 
    if ($EventArgs.Succeeded) {
        Write-Host "Value: $($EventArgs.AttributeData.Value)"
    }
    else {
        Write-Host "*** Failure: $($EventArgs.ErrorMessageBrief)"
    }
}

Write-Host "Subscribing..."
$handle = $client.SubscribeDataChange($endpointDescriptor, "nsu=http://test.org/UA/Data/ ;i=10853", 1000)

Write-Host "Processing data change events for 10 seconds..."
$stopwatch =  [System.Diagnostics.Stopwatch]::StartNew() 
while ($stopwatch.Elapsed.TotalSeconds -lt 10) {    
    Start-Sleep -Seconds 1
}

Write-Host "Changing subscription..."
$client.ChangeMonitoredItemSubscription($handle, 100)

Write-Host "Processing data change events for 10 seconds..."
$stopwatch =  [System.Diagnostics.Stopwatch]::StartNew() 
while ($stopwatch.Elapsed.TotalSeconds -lt 10) {    
    Start-Sleep -Seconds 1
}

Write-Host "Unsubscribing..."
$client.UnsubscribeAllMonitoredItems()

Write-Host "Waiting for 5 seconds..."
Start-Sleep -Seconds 5

Write-Host "Finished."

#endregion Example
