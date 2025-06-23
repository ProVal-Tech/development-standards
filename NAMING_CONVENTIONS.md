```mermaid
%%{init: {'flowchart' : {'curve' : 'stepBefore'}}}%%
flowchart TD

    A[Creating Content] --- B{Is it a PowerShell script?}

    B ---|Yes| C[Use PowerShell Naming:<br>Verb-Noun]
    C --- CEx[/Restart-Service -IfHung/]

    B ---|No| D{Is it an RMM script?}
    D ---|Yes| E[Use Action-Based Naming:<br>Action - Target - Scope/Qualifier]
    E --- EEx[/Install Chrome - All Users/]

    D ---|No| F{Is it a Report or Dataview?}
    F ---|Yes| G[Use Structured Naming:<br>Focus Area - Detail/Filter - Scope]
    G --- GEx[/Patch Compliance - Missing Updates - ClientX/]

    F ---|No| H[Use Monitor Format:<br>Condition - Trigger - Target/Scope - Severity]
    H --- HEx[/Disk Space Low - Below 10% - System Drive - Critical/]
    classDef dotted stroke-width:2px,color:#fff,stroke-dasharray:5 5
    class CEx,EEx,GEx,HEx dotted
```

## 🟦 PowerShell Scripts

**Format:**

```
Verb-Noun [-Qualifier] [-Target]
```

**Examples:**

* `Restart-Service -IfHung`
* `Clear-EventLog -OlderThan30Days`
* `Install-Chrome`
* `Update-BIOS -Dell`
* `Set-TimeZone -UTC`

## 🟨 RMM Scripts

**Format:**

```
[Action] - [Target] - [Scope/Qualifier]
```

**Examples:**

* `Clear Temp Files - Workstations - All`
* `Install Chrome - All Users`
* `Restart Print Spooler - If Stopped`
* `Update BIOS - Dell Systems`


## 🟩 Reports / Dataviews

**Format:**

```
[Focus Area] - [Detail/Filter] - [Scope]
```

**Examples:**

* `Patch Compliance - Missing Updates - Workstations`
* `Ticket Volume - Monthly`
* `Asset Inventory - ClientX`
* `Service Performance - Tier 1`

## 🟥 Monitors

**Format:**

```
[Condition] - [Trigger/Threshold] - [Target/Scope] - [Severity/Action]
```

**Examples:**

* `Disk Space Low - Below 10% - System Drive - Critical`
* `Service Stopped - Print Spooler`
* `Login Failures - Excessive - RDP - Warning`
* `Patch Window Missed - All Workstations`

## 🧾 Quick Reference Summary

| Content Type    | Format Template                                                          | Example                                       |
| --------------- | ------------------------------------------------------------------------ | --------------------------------------------- |
| **PowerShell**  | `Verb-Noun [-Qualifier] [-Target]`                                       | `Remove-TempFiles`, `Set-TimeZone -UTC`       |
| **RMM Script**  | `[Action] - [Target] - [Scope/Qualifier]`                                | `Install Chrome - All Users`                  |
| **Report/View** | `[Focus Area] - [Detail/Filter] - [Scope]`                               | `Asset Inventory - Workstations`              |
| **Monitor**     | `[Condition] - [Trigger/Threshold] - [Target/Scope] - [Severity/Action]` | `CPU Usage High - 95% - 5 Min Avg - Critical` |