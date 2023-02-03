# General Code Standards

This document outlines general guidelines for writing code at ProVal. These are overarching concepts that apply to all development, regardless of platform.

We want our work to function as expected, be testable, well composed, and easily parsed by other developers.

> ↩️ Standards for specific languages can be found in their respective language subfolder. Be sure to read this document before diving into other languages!

## Functionality
Your code should accomplish the task it was written for. A developer can manage major flaws and failures during the development phase without worry. However, releasing a project that does not accomplish its intended goal or does more than what would otherwise be apparent from the codebase and documentation will not be accepted. Always avoid accomplishing more than one overarching goal with your code.

> 🔎 John Smith enters an issue (#23) into the repository for `Get-Hamburger`, a PowerShell script that returns one or more hamburger emojis (🍔) based on a `-Count` parameter. John asked if it was possible to make a `-Height` parameter which would intelligently stack the hamburgers on individual lines. Nathan, a developer of the project, creates a branch (`feat/23-burger-stack`) and takes ownership of the issue.
>
> ✅ Nathan develops the feature, puts in a pull request, and awaits approval.
> 
> ✅ Nathan develops the feature along with another optional parameter: `-Width`. This parameter allows setting the width of the burger stack as well as the height. Nathan puts in a pull request and awaits approval.
> 
> ❌ Nathan develops the feature along with another optional parameter: `-Hotdog`. This parameter changes all of the hamburger emojis to hot dog emojis (🌭). Because the entire Get-Hamburger project is centered around hamburgers, this was an inappropriate addition. He should have created a new project for `Get-HotDog` instead.
>
> ❌ Nathan develops the feature and puts in a pull request. The reviewer finds that Nathan's code ignores the `-Count` parameter and prints out a vertical line of hamburgers equal to the `-Height` parameter. This was not the intention of the request, and the PR was sent back to Nathan with changes requested.
>
> ❌ Nathan develops the feature along with another optional parameter: `-Cheese`. This parameter adds a cheese emoji (🧀) next to all of the hamburger emojis. Because cheese is indeed related to a project centered around hamburgers, this was an appropriate addition, but not for this issue. He should have created a new issue and branch for adding this feature instead.

## Validation
> ❗ Once ProVal fully implements unit testing, the standards here will change.

Many times when a piece of code is performing a specific task we should ensure that it completes that task successfully and return any applicable errors. Without this, knowing if something went wrong with the process is very difficult to discern. This does not mean that we need to make sure that every log message gets written to the console, but it does mean that when we write logic, we should perform testing to ensure that what we wrote works.

> ✅ Here are some good examples of validating that a file was successfully downloaded in PowerShell.
> ```powershell
> # Download the file
> (New-Object System.Net.WebClient).DownloadFile('https://provaltech.com/files/mypic.png', 'C:\temp\mypic.png')
> # Validate that the file was downloaded, and throw an error if not
> if(!(Test-Path -Path 'C:\temp\mypic.png')) {
>     Write-Error -Message "Failed to download file 'https://provaltech.com/files/mypic.png'"
> }
> ```
> ```powershell
> try {
>    (New-Object System.Net.WebClient).DownloadFile('https://provaltech.com/files/mypic.png', 'C:\temp\mypic.png')
> } catch {
>    Write-Error -Message "Failed to download file 'https://provaltech.com/files/mypic.png'" -Exception $_.Exception
> } 
> ```

## Composition
Composition refers to how your code is structured. We should be writing code that any other DevOps team member can jump into and understand relatively easily. This means that your code logic should "document itself" in its structure. Some key points on how to compose code properly:

### One-off Functions
Generally avoid one-off functions. Having to revisit previous lines of code unnecessarily just to understand the logic is a time waster. Instead, write the logic that you would have written in a one-off function in your actual execution.

> ❌ Here is an example of a one-off function in the script `Get-Burger`
> ```powershell
> function Add-CheeseToBurger {
>     return '🧀'   
> }
> $burger = '🍔'
> if($AddCheese) {
>    $burger += Add-CheeseToBurger
> }
> ```
> ✅ A better way:
> ```powershell
> $burger = "🍔$(if ($AddCheese) {'🧀'} )"
> ```

### Avoid Commenting
Avoid commenting in the majority of cases. Your code should describe what it is doing on its own. Only comment in the case where something that you are doing may not make sense to a reader, is generally unknown, or particularly obscure.

> ❗This does not apply to sections such as [`comment-help`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help) in PowerShell or [`doc-comments`](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/documentation-comments) in C#. See the individual DOCUMENTATION.md files in the language standards for more information on these.

### Limit Nesting
[Nest](https://en.wikipedia.org//wiki/Nesting_(computing)#In_programming) as little as possible. The more you nest, the more difficult your code will be to parse for the reader and maintainability is reduced. Attempt to keep your code from going more than three levels deep. For more about "never-nesting", see [this video](https://www.youtube.com/watch?v=CFRhGnuXG-4).

> ❌ An example of going too deep:
> ```powershell
> function Test-DomainAdmin {
>     # 1
>     if ($user.IsAdmin) {
>         # 2
>         foreach ($group in $user.groups) {
>             # 3
>             if ($group.Name -eq 'Domain Admins') {
>                 # 4
>                 if ($user.IsActive) {
>                     # 5
>                     return $true
>                 }
>             }
>         }
>     }
> }
> ```

## Readability
While this may seem similar to composition, the Readability standard is focused primarily on grammar, naming, and capitalization.

### Grammar
When writing comments, a professional-level writing style is expected. Improper grammar or references to the developer in the first-person are not permitted.

### Naming
Any structure that needs a name should have one that describes itself well without the need for comments. The names should not be particularly long, but must still quickly convey the purpose of the structure.

> ❌
> ```powershell
> $out = Invoke-RestMethod -Uri 'https://api.provaltech.com/v1/GetUsers'
> ```
> ❌
> ```powershell
> $provalUsersFromTheApiEndpoint = Invoke-RestMethod -Uri 'https://api.provaltech.com/v1/GetUsers'
> ```
> ✅
> ```powershell
> $provalUsers = Invoke-RestMethod -Uri 'https://api.provaltech.com/v1/GetUsers'
> ```


## Security
Whenever writing code at ProVal, we should always have security in mind. If something may be insecure, expose sensitive information, or have a vulnerability to an attack by a bad actor, we should make every effort to prevent this or use a different strategy.

### SQL Injection
> SQL injection is a type of security vulnerability that occurs in the database layer of an application. It allows an attacker to inject malicious SQL code into a query, which can then be executed by the database server to manipulate or extract sensitive information from the database. This can result in serious security breaches, such as theft of confidential data or unauthorized access to sensitive systems. To prevent SQL injection attacks, developers should use proper input validation and sanitization, and should use prepared statements or parameterized queries when interacting with databases.
> 
> 🤖 *Generated by [ChatGPT](https://chat.openai.com/)*

Using parameterized queries, sanitized statements, and other mitigation techniques  will assist in preventing SQL injection attacks. Whenever user-provided data is being ingested into a database, proper strategies to ensure security is paramount.

### Passwords
Whenever a password is required in code, it should be properly secured. This means that if at all possible, a secure type of transmission and storage should be used. At no point should we store passwords in a plaintext string. Objects representing connection strings, connections, or any other sensitive entity should be disposed of as soon as its lifecycle is complete.

### Third-party Sources
In general, any third-party source that we use in our code should be vetted beforehand. This means that other applications, libraries, or code-bases can be used in ProVal code, but they must be reviewed and understood before use.

> ✅ 7-Zip's standalone applications and libraries are a good example of a trusted third-party source.
> 
> ❌ An open-source wrapper for 7-Zip that has not been previously reviewed is not an acceptable source.