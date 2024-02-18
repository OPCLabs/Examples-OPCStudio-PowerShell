﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to read 4 items at once, and display their values, timestamps and qualities.
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.DataAccess

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicCore.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassic.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicComponents.dll"

# Instantiate the client object.
$client = New-Object EasyDAClient

$vtqResults = [IEasyDAClientExtension]::ReadMultipleItems($client, "OPCLabs.KitServer.2", @(
    (New-Object DAItemDescriptor("Simulation.Random")),
    (New-Object DAItemDescriptor("Trends.Ramp (1 min)")),
    (New-Object DAItemDescriptor("Trends.Sine (1 min)")),
    (New-Object DAItemDescriptor("Simulation.Register_I4"))
    ))

for ($i = 0; $i -lt $vtqResults.Length; $i++) {
    $vtqResult = $vtqResults[$i]
    if ($vtqResult.Succeeded) {
        Write-Host "vtqResults[$($i)].Vtq: $($vtqResult.Vtq)"
    }
    else {
        Write-Host "vtqResults[$($i)] *** Failure: $($vtqResult.ErrorMessageBrief)"
    }
}

#endregion Example
