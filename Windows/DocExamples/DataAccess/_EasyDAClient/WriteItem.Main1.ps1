﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example
# This example shows how to write a value, timestamp and quality into a single item.
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

#requires -Version 5.1
using namespace System
using namespace OpcLabs.EasyOpc.DataAccess
using namespace OpcLabs.EasyOpc.OperationModel

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicCore.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassic.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicComponents.dll"

# Instantiate the client object.
$client = New-Object EasyDAClient

try {
    [IEasyDAClientExtension]::WriteItem($client, "", "OPCLabs.KitServer.2", "Simulation.Register_I4",
        12345, [DateTime]::SpecifyKind((New-Object DateTime(1980, 1, 1)), [DateTimeKind]::Utc), 192)
}
catch [OpcException] {
    Write-Host "*** Failure: $($PSItem.Exception.GetBaseException().Message)"
    return
}

Write-Host "Success"

#endregion Example
