# VSA Agent Procedure Standards

> ↩️ Be sure to read the [general guide](../CODE.md) before diving into this one!

This document describes the expectations at ProVal when writing VSA Agent Procedures. It currently addresses formatting and location.

## Location
> 🚧 The location of scripts will be changing in the coming months, as will the content of this section.

Agent Procedures currently in the development or approval process should be located in the Shared \ Development folder in VSA. 
Agent Procedures that have been released for Non-Stack use should be located in the Shared \ ProVal Procedure Repository folder.
Agent Procedures written in the Client-Specific scope should be located in the Shared \ Client Specific \ [Client Name] folder.

## Description

A short description should be placed in the description of the agent procedure, which is accessed on the right hand pane within the Procedure Editor.

## Procedure Structure
### ***Setup***
The beginning of the agent procedure should prepare the script engine and endpoint for proper execution of the required task. Perform any applicable actions below in the listed order.
1. Set all variables
    - Variables should be clearly named for the function they are performing.
    - Variables should be set in camelCase.
    - Managed Variables (<VAR_NAME>) can be used, and should be notated by angle brackets when called in the script. Managed variables should always be created in the Public scope, in UPPER_CASE.
    - Custom global variables (#Global:VarName) should be used sparingly, and in CapitalCamelCase.
    - [Database Views](https://help.kaseya.com/WebHelp/EN/VSA/9050000/#3480.htm) are a special type of variable that can be called when needed. All evnrionments support the use of DatabaseViews.
    - See the VSA Documentation for [Using Variables](https://help.kaseya.com/WebHelp/en/VSA/6000100/index.htm?toc.htm?2855.htm) for more information.


2. Prepare the working directory (If applicable)
    > ❗The standard endpoint directory for ProVal file storage is *%ProgramData%\\\_automation\AgentProcedure\ProcedureNameNoSpaces*
   <pre>
   ✅
   <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4910.htm">getVariable</a>("Agent Install Drive", "", "drive")
   <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4910.htm">getVariable</a>("Constant Value", "#drive#\ProgramData\_automation\AgentProcedure\[ProcedureNameNoSpaces]", "directory")
   <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7853.htm">executePowershell</a>(" ", "New-Item -Type Directory -Path #drive#ProgramData\_automation\AgentProcedure -Name [ProcedureNameNoSpaces] -ErrorAction SilentlyContinue")
   </pre>
<br>

1. Download any external resources needed.
    > ❗Use the built-in methods for file acquisition whenever possible to reduce script engine overhead.

    <code>
    ✅ <a href ="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4909.htm">getURL</a>("https:\\file.provaltech.com\repo\script\Get-Educated.ps1", "#directory#\Get-Educated.ps1", "All Operating Systems", "Halt on Fail")<br><br>

    ✅ <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4923.htm">writeFile</a>("ManagedFile.ps1", "#directory#\ManagedFile.ps1", "All Operating Systems", "Halt on Fail")<br><br>

    ❌ <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7853.htm">executePowershell</a>("","Invoke-WebRequest -Uri https:\\dontdo.this -Path #directory#\dontdo.this)<br><br>
    </code>
    > ❗ Be sure to check that your files were successfully deposited on the endpoint. Perform your logic within the **Then** block. Your **Else** blocks should always be your failure case and be at the end of the procedure.

    <code>
    ✅
    if <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4890.htm">testFile</a>("#directory#\Get-Educated.ps1") Exists<br>
        &nbsp;&nbsp;&nbsp;[Perform Script Logic]<br>
    <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#10548.htm">else</a> <br>
        &nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4925.htm">writeProcedureLogEntry</a> ("The script failed to acquire the required resource. Exiting.")<br><br>
    </code>

### ***Logic***
#### **Nesting**
Unlike other languages, VSA Agent Procedure scripting requires extensive nesting for more complicated logical processes. Try to limit excessive nesting as much as possible while still accomplishing the goal of the script.

Nesting can sometimes be avoided through the use of ```#Global:Variables#``` as a flag of sorts:<br>
    <code>
    ✅<br>
    <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4910.htm">getVariable</a>("1","Global:InstallFlag")<br>
    if <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4890.htm">testFile</a>("install.msi") Does Not Exist<br>
        &nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4910.htm">getVariable</a>("0","Global:InstallFlag)<br>
    if <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7877.htm">getOS</a>() 32-Bit Windows<br>
        &nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4910.htm">getVariable</a>("0","Global:InstallFlag)<br>
    <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4887.htm">checkVar</a>(#Global:InstallFlag#) Is Equal To "1"<br>
        &nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7864.htm">installMSI</a>("install.msi")<br>
    <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#10548.htm">else</a><br>
        &nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4925.htm">writeProcedureLogEntry</a>("Installation Pre-checks did not pass.")<br><br>
    ❌<br>
    if <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4890.htm">testFile</a>("install.msi") Exists<br>
        &nbsp;&nbsp;&nbsp;if <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7877.htm">getOS</a>() 64-Bit Windows<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7864.htm">installMSI</a>("install.msi")<br>
        &nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#10548.htm">else</a><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4925.htm">writeProcedureLogEntry</a>("Installation Pre-checks did not pass.")<br>
    <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#10548.htm">else</a><br>
        &nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4925.htm">writeProcedureLogEntry</a>("Installation Pre-checks did not pass.")<br>
    </code><br><br>
#### **Escaping**
VSA runs almost all logic through a bash or cmd engine, and includes double-quotes in any console command passed through the script. Because of this, special care has to be taken when passing Shell and PowerShell commands directly through the script.
- PowerShell commands with double quotes *within the command* must be **triple** escaped. Try to use single quotes whenever possible.<br><br>
<code>
✅<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7853.htm">executePowershell</a>("","Get-ChildItem -Path 'my stuff'")<br>
❌<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7853.htm">executePowershell</a>("","Get-ChildItem -Path "my stuff"")<br>
✅<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7853.htm">executePowershell</a>("","$Get-ChildItem -Path """"my stuff"""" ")<br>
<br>
</code>
- Shell Commands run within the procedure can be escaped using standard bash escape sequences, with no additional escape needed.

Always be mindful of when VSA will encapsulate your statement within a set of double-quotes, and plan accordingly.

#### **Comments**
Keep your comments to a minimum within the Agent Procedure. Not only should your code explain itself in most cases, a current VSA memory leak causes a crash in performance when too many comments exist in the script.
If you must comment your procedure, you can do so with a double-forward-slash.<br>
<code>
// this is a comment
</code><br>
### ***Sanity Checking***
Your code should check to ensure that it's main goal succeeded after the main logic, and report to the Procedure Log (or terminate) otherwise. 
<br><br>
<code>
<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#7864.htm">installMSI</a>(installer.msi)<br>
if <a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4889.htm">isServiceRunning</a>("installed application service")<br>
&nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4925.htm">writeProcedureLogEntry</a>("Application Installed Successfully")<br>
<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#10548.htm">else</a><br>
&nbsp;&nbsp;&nbsp;<a href="https://help.kaseya.com/WebHelp/EN/VSA/9050000/#4925.htm">writeProcedureLogEntry</a>("ERROR: Application Failed to Install")<br>
