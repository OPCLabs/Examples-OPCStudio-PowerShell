# $Header: $
# Copyright (c) CODE Consulting and Development, s.r.o., Plzen. All rights reserved.

# Find all latest examples here: https://opclabs.doc-that.com/files/onlinedocs/OPCLabs-OpcStudio/Latest/examples.html .
# OPC client and subscriber examples in PowerShell on GitHub: https://github.com/OPCLabs/Examples-QuickOPC-PowerShell .
# Missing some example? Ask us for it on our Online Forums, https://www.opclabs.com/forum/index ! You do not have to own
# a commercial license in order to use Online Forums, and we reply to every post.

#requires -Version 5.1
using namespace OpcLabs.EasyOpc.DataAccess

# The path below assumes that the current directory is [ProductDir]/Examples-NET/PowerShell/Windows .
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicCore.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassic.dll"
Add-Type -Path "../../../Components/Opclabs.QuickOpc/net472/OpcLabs.EasyOpcClassicComponents.dll"

# Create EasyOPC-DA component 
$client = New-Object EasyDAClient

# Read item value and display it
# Note: An exception can be thrown from the statement below in case of failure. See other examples for proper error 
# handling  practices!
$client.ReadItemValue("", "OPCLabs.KitServer.2", "Demo.Single")
