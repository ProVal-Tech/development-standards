# Get-RandomNumberList
> ↩️ This script is located at [here](Example.ps1) if you'd like to reference it alongside this example documentation.
## Overview
Generates a set of random numbers starting at a specific number and ending at a specific number.

## Requirements
- PowerShell v5

## Usage
Generates a set of 6 random numbers from 1 to 100.
```powershell
.\Get-RandomNumberList.ps1 -Start 1 -End 100 -Count 6
```
Generates a set of 5 random numbers from 10 to 20 and gets the largest one of them.
```powershell
$randomNumbers = .\Get-RandomNumberList.ps1 -s 10 -e 20
$randomNumbers | Sort-Object | Select-Object -Last 1
```

## Parameters
### `-Start`
The smallest random number to generate.

| Aliases | Required | Default Value |  Type   |
| :-----: | :------: | :-----------: | :-----: |
|  `-s`   |   True   |               | `[int]` |

---
### `-End`
The largest random number to generate.

| Alias | Required | Default Value |  Type   |
| :---: | :------: | :-----------: | :-----: |
| `-e`  |   True   |               | `[int]` |

---
### `-Count`
The number of random numbers to generate.

| Alias | Required | Default Value |  Type   |
| :---: | :------: | :-----------: | :-----: |
|       |  False   |       5       | `[int]` |


## Output
`[int[]]`

### Log Files
    .\Get-RandomNumberList-log.txt
