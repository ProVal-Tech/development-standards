#requires -Version 5
<#
.SYNOPSIS
    Generates a set of random numbers starting at a specific number and ending at a specific number.
.PARAMETER Start
    The smallest random number to generate.
.PARAMETER End
    The largest random number to generate.
.PARAMETER Count
    The number of random numbers to generate.
.EXAMPLE
    Get-RandomNumberList.ps1 -Start 1 -End 100 -Count 6
    Generates a set of 6 random numbers from 1 to 100.
.EXAMPLE
    $randomNumbers = .\Get-RandomNumberList.ps1 -s 10 -e 20
    $randomNumbers | Sort-Object | Select-Object -Last 1
    Generates a set of 5 random numbers from 10 to 20 and gets the largest one of them.
.OUTPUTS
    [int[]]
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory)][Alias('s')][int]$Start,
    [Parameter(Mandatory)][Alias('e')][int]$End,
    [Parameter()][int]$Count = 5
)
for ($i = 0; $i -lt $Count; $i++) {
    # Get-Random will never return the -Maximum value, so we have to add 1 to it.
    Get-Random -Minimum $Start -Maximum ($End + 1)
}