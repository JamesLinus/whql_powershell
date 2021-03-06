﻿##/***************************************
## Copyright (c) All rights reserved
##
## File: Library_WHQL_ENV_Parsing.ps1
##
## Authors (s)
##
##   Mike Cao <bcao@redhat.com>
##
## File name:
##   Library_WHQL_HCK_MachinePoolAPI.ps1
##
## This file is used parsing HCK machinepool apis
##
## This work is licensed under the terms of the GNU GPL,Version 2.
##
##****************************************/
#$Library_WHQL_ENV_Parsing_Path = Split-Path $myInvocation.MyCommand.Path
#. (Join-Path $Library_WHQL_ENV_Parsing_Path Library_WHQL_ENV_Parsing.ps1)

#function local:GetScriptDirectory
#{
#    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
#    Split-Path $Invocation.MyCommand.Path
#}

#. (Join-Path (GetScriptDirectory) "Library_WHQL_ENV_Parsing.ps1" )

function local:LoadObjectModel($Dllfile)
{
    return [Reflection.Assembly]::LoadFrom($env:WTTSTDIO + $Dllfile)
}

function local:ConnectDataBaseManager($ControllerName)
{
    new-object -typename Microsoft.Windows.Kits.Hardware.ObjectModel.DBConnection.DatabaseProjectManager -Args $ControllerName, DTMJobs
}

#Get Root Pool
function local:GetRootMachinePool($Manager)
{
    $Manager.GetRootMachinePool()
}

#Get Default Machine Pool
function local:GetDefaultMachinePool($RootPool)
{
    $RootPool.DefaultPool
}


#$RootPool
function local:IsMachinePoolExecutable($MachinePool)
{
    $MachinePool.Executable
}

function local:IsRootPool($MachinePool)
{
    $MachinePool.RootPool
}

#the name of this machine pool.
function local:GetMachinePoolName ($MachinePool)
{
    $MachinePool.Name
}

#get machine pool path
function local:GetMachinePoolPath ($MachinePool)
{
    $MachinePool.Path
}

##return Machine Pool
function DeleteChildMachinePool($FatherMachinePool , $ChildMachneName)
{
    $FatherMachinePool.DeleteChildPool($ChildMachineName)
}


##return Machine Pool
function local:CreateChildMachinePool($FatherMachinePool , $ChildMachineName)
{
    $FatherMachinePool.CreateChildPool($ChildMachineName)
}



##Function : Delete machine in the machine pool
##Return : none
function DeleteMachine($MachinePool , $MachineName)
{
    $MachinePool.DeleteMachine($MachineName)
}

#Function : Machine Pool Equals Method 
#Return :Returns Boolean, which has a value of true if the two OSPlatforms are equal, or a value of false if they are different.
function MachinePoolEqual($MachinePool ,$Othermachinepool)
{
    $MachinePool.Equals($OtherMachinePool)
}

#Function :Object Equals Method
#Return: Return Balloon
function ObjectEqual($MachinePool ,$OtherMachinePool)
{
    $MachinePool.Equals($OtherMachinePool)
}

#Function GetChildPools
#Return :Collection of MachinePools 
function GetChildMachinePools($MachinePool )
{
    $MachinePool.GetChildPools()
}

#function: GetMachines
#Return : a collection of machines in the machine pool
function GetMachines ($MachinePool)
{
    $MachinePool.GetMachines()
}

#Function GetHashCode
#Return INT32 which is a unique number which is the MachineSet hash code
function GetHashCode ($MachinePool)
{
    $MachinePool.GetHashCode()
}

#Function MoveMachineTo Method
#return none
function MoveMachineToMethod ($MachinePool ,$Machine , $OtherMachinePool)
{
    $MachinePool.MoveMachineTo($Machine, $OtherMachinePool)
}




