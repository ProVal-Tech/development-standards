# PowerShell Code Standards

> ↩️ Be sure to read the [general guide](../CODE.md) before diving into this one!

This document describes the expectations at ProVal when writing PowerShell code. It currently addresses formatting and location. These standards are primarily based on the [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer). Its documentation will be referenced frequently below.

## Location
> 🚧 The location of scripts will be changing in the coming months, as will the content of this section.

All production PowerShell scripts should be located in the [scripts repository](https://github.com/ProVal-Tech/scripts) under their own individual folder.

## Requirements
All scripts should include `#requires` sections where needed. For more information about this see [this Microsoft article](https://learn.microsoft.com/en-us/previous-versions/powershell/module/microsoft.powershell.core/about/about_requires?view=powershell-7.1).

## Formatting
At ProVal we have a standard format for PowerShell to facilitate ease of code review and troubleshooting. The headings below describe these requirements.

>❗ Note that in VSCode, pressing `Shift` + `Alt` + `F` will apply the applicable PSAnalyzerSettings to your current script.

### Avoid Using Double Quotes for Constant Strings
[AvoidUsingDoubleQuotesForConstantString.md](https://github.com/PowerShell/PSScriptAnalyzer/blob/master/docs/Rules/AvoidUsingDoubleQuotesForConstantString.md)

Do not put constant strings in double quotes. Exceptions to this rule exist and are illustrated in the above link.
> ❌
> ```powershell
> function Get-Sammie {
>     return "A yummy sammie"
> }
> ```
> 
> ✅
> ```powershell 
> function Get-Sammie {
>     return 'A yummy sammie'
> }
> ```

### Opening Brace Location
[PlaceOpenBrace.md](https://github.com/PowerShell/PSScriptAnalyzer/blob/master/docs/Rules/PlaceOpenBrace.md)

Open braces should be on the same line as the preceding keyword.

> ❌
> ```powershell
> function Get-Sammie
> {
>     return 'A yummy sammie'
> }
> ```
> 
> ✅
> ```powershell 
> function Get-Sammie {
>     return 'A yummy sammie'
> }
> ```

### Closing Brace Location
[PlaceCloseBrace.md](https://github.com/PowerShell/PSScriptAnalyzer/blob/master/docs/Rules/PlaceCloseBrace.md)

A close brace should not have empty lines or other symbols before it, unless it is a one-line block.

> ❌
> ```powershell
> function Get-Sammie {
>     return 'A yummy sammie'
> 
> }
> ```
> ❌
> 
> ```powershell
> function Get-Sammie {
>     return 'A yummy sammie' }
> ```
> 
> ✅
> 
> ```powershell
> function Get-Sammie {
>     return 'A yummy sammie'
> }
> ```
> 
> ✅
> 
> ```powershell
> function Get-Sammie { return 'A yummy sammie' }
> ```

### Use Correct Casing
[UseCorrectCasing.md](https://github.com/PowerShell/PSScriptAnalyzer/blob/master/docs/Rules/UseCorrectCasing.md)

PowerShell cmdlets should use their correct casing for readability. Currently PSAnalyzer does not do this for custom functions, but you are expected to follow the standards for built-in cmdlets with your own functions.

> ❌
> 
> ```powershell
> function get-sammie {
>     return 'A yummy sammie'
> }
> ```
> 
> ✅
> 
> ```powershell
> function Get-Sammie {
>     return 'A yummy sammie'
> }
> ```

### Whitespace Use

[UseConsistentWhitespace.md](https://github.com/PowerShell/PSScriptAnalyzer/blob/master/docs/Rules/UseConsistentWhitespace.md)

Whitespace should be consistent across scripts. The following whitespace rules are expected to be followed:

-  A space after the opening brace and a space before the closing brace.
> ❌
> ```powershell
> function Get-Sammie {return 'A yummy sammie'}
> ```
> ✅
> ```powershell
> function Get-Sammie { return 'A yummy sammie' }
> ```

-  A space between a keyword and its corresponding open brace. 
> ❌
> ```powershell
> function Get-Sammie{ return 'A yummy sammie' }
> ```
> ✅
> ```powershell
> function Get-Sammie { return 'A yummy sammie' }
> ```

-  A space between a keyword and its corresponding open parenthesis.
> ❌
> ```powershell
> if('sammie') { return 'yum' }
> ```
> ✅
> ```powershell
> if ('sammie') { return 'yum' }
> ```

-  Binary and unary operators surrounded on both sides by a space.
> ❌
> ```powershell
> $sammie='yum'
> ```
> ✅
> ```powershell
> $sammie = 'yum'
> ```

-  Commas and semicolons followed by a space.
> ❌
> ```powershell
> @('bacon','cheese','bread')
> ```
> ✅
> ```powershell
> @('bacon', 'cheese', 'bread')

> ❌
> ```powershell
> $sammie = 'yum';return $sammie
> ```
> ✅
> ```powershell
> $sammie = 'yum'; return $sammie
> ```

- Pipes surrounded on both sides by a space and only one space.
> ❌
> ```powershell
> Get-Sammie| Invoke-Sammie
> ```
> ❌
> ```powershell
> Get-Sammie  |  Invoke-Sammie
> ```
> ✅
> ```powershell
> Get-Sammie | Invoke-Sammie
> ```

### Consistent Indentation
[UseConsistentIndentation.md](https://github.com/PowerShell/PSScriptAnalyzer/blob/master/docs/Rules/UseConsistentIndentation.md)

Use 4 spaces for indentation. Indentation for pipelines should only be one indent deep.

> ❌
> ```powershell
> function Get-Sammie {
>   return 'A yummy sammie'
> }
> ```
> 
> ✅
> ```powershell
> function Get-Sammie {
>     return 'A yummy sammie'
> }
> ```

> ❌
> ```powershell
> Get-Sammie |
> Invoke-Sammie
> ```
> 
> ❌
> ```powershell
> Get-Sammie |
>     Invoke-Sammie |
>         Set-Sammie
> ```
> 
> ✅
> ```powershell
> Get-Sammie |
>     Invoke-Sammie |
>     Set-Sammie
> ```