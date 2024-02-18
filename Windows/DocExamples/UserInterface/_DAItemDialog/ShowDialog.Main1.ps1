﻿# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

#region Example

# This example shows how to let the user browse for an OPC Data Access item. 
#
# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcForms.dll"

$itemDialog = New-Object OpcLabs.EasyOpc.DataAccess.Forms.Browsing.DAItemDialog
$itemDialog.ServerDescriptor.ServerClass = "OPCLabs.KitServer.2"

$dialogResult = $itemDialog.ShowDialog()
if ($dialogResult -ne [System.Windows.Forms.DialogResult]::OK) {
    return
}

# Display results
Write-Host "NodeElement: $($itemDialog.NodeElement)"

#endregion Example
