```mermaid
%%{init: {'flowchart' : {'curve' : 'stepBefore'}}}%%
flowchart TD

    A[Creating Content] --- B{Is it a PowerShell script?}

    B ---|Yes| C[Format:<br>Verb-Noun]
    C --- CEx[/Restart-Service/]

    B ---|No| D{Is it an RMM script?}
    D ---|Yes| E[Format:<br>Action - Target - Scope/Qualifier]
    E --- EEx[/Restart Service - Windows/]

    D ---|No| F{Is it a Report or Dataview?}
    F ---|Yes| G[Format:<br>Focus Area - Detail/Filter - Scope]
    G --- GEx[/Windows Services - Stopped - Servers/]

    F ---|No| H[Format:<br>Condition - Trigger - Target/Scope]
    H --- HEx[/Service Stopped - Print Spooler - Servers/]
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
[Condition] - [Trigger/Threshold] - [Target/Scope]
```

**Examples:**

* `Disk Space Low - Below 10% - System Drive`
* `Service Stopped - Print Spooler`
* `Login Failures - Excessive - RDP`
* `Patch Window Missed - All Workstations`

## 🧾 Quick Reference Summary

| Content Type    | Format Template                                      | Example                                 |
| --------------- | ---------------------------------------------------- | --------------------------------------- |
| **PowerShell**  | `Verb-Noun [-Qualifier] [-Target]`                   | `Remove-TempFiles`, `Set-TimeZone -UTC` |
| **RMM Script**  | `[Action] - [Target] - [Scope/Qualifier]`            | `Install Chrome - All Users`            |
| **Report/View** | `[Focus Area] - [Detail/Filter] - [Scope]`           | `Asset Inventory - Workstations`        |
| **Monitor**     | `[Condition] - [Trigger/Threshold] - [Target/Scope]` | `CPU Usage High - 95% - 5 Min Avg`      |