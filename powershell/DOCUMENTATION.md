# PowerShell Documentation Standards

> ↩️ Be sure to read the [general guide](../DOCUMENTATION.md) before diving into this one!

PowerShell documentation is comprised of two major sections: `comment-help` and the `README`.

## comment-help
The `comment-help` block is used to document your code in the code. It provides helpful information for others while troubleshooting as they can utilize the `Get-Help` cmdlet to see what it should be doing at a glance. The following sections of the comment help should be filled out at a minimum. For an exhaustive list of fields (that you are free to use) see [Microsoft's article on Comment-based Help](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-7.3). Each script and child function of a script should have its own `comment-help` section.

### .SYNOPSIS
A brief description of the function or script. Keep this to one or two short sentences.

### .PARAMETER `<param>`
The description of a parameter. Add a `.PARAMETER` keyword for each parameter in the function or script syntax.

### .EXAMPLE
A sample command that uses the function or script, optionally followed by sample output and a description. You can have multiple `.EXAMPLE` entries, but must have at least one.

### .OUTPUTS
The .NET type of the objects that the cmdlet returns. You should also include a description of the returned objects.

## README
The README.md for a script is the primary way that users will know how to execute it. It should be located in the same directory as the script and be named `README.md`. It must be detailed enough to inform the user exactly what the script does and how to run it without overwhelming them with information.

> ↩️ Check out the [Example.md](Example.md) to see a properly formatted README.

The following sections are expected to be filled out when writing a README.

> ❓ These headings look similar to the `comment-help`. Can we use the content from our `comment-help` in the README?
>
> 💡 For the most part, yes! If you have already written your `comment-help` block, you are the majority of the way there to writing your README.

### Title
The title of the script as H1 (`# My-Script`).
### Overview
A brief description of the function or script. Keep this to one or two short sentences.

### Requirements
A bulleted list of pre-requisites that must be available ***before*** launching the script. These are generally requirements like PowerShell version and running as an Administrator. They should closely mirror your `#requires` statements.

> ❓ Do I include a module that I'm installing later in the script?
>
> 💡 No, as it is not a ***pre***-requisite. If your script expects that a module is already installed, then it is a pre-requisite and should be included in the list.

### Usage
Include some examples of how your script can be run. Start from simple to advanced usage for multiple examples. At least one example is required for this section. Be sure to use appropriate markdown syntax for PowerShell.

### Parameters
A formatted list of parameters for your script. A parameter entry should include the following data points:
- Any aliases for the parameter
- Is the parameter mandatory? (True, False, or Sometimes)
- The default value, if any, for the parameter.
- The object type of the parameter
- A description of the parameter and any information specific to it.



A parameter list should be in the following heading-based format:

> ❓ What happened to the table-based parameters?
>
> 💡 While easier to parse quickly, the parameter tables left little room for the description and caused some very messy looking markdown. Moving them under their own headings makes it both easier to read and more navigable.

#### `-Parameter1`
Description of Parameter 1

| Aliases | Required | Default Value  |    Type    |
| :-----: | :------: | :------------: | :--------: |
|  `-p1`  |  False   | `Hello world!` | `[string]` |

---
#### `-Parameter2`
Description of Parameter 2

| Alias | Required | Default Value |          Type          |
| :---: | :------: | :-----------: | :--------------------: |
| `-p2` |   True   |               | `[System.IO.FileInfo]` |

### Output
List the type of objects, if any, the script outputs and the location of any log messages. This can also include additional output locations like tables or registry locations.