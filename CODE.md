> 🚧 This standard is currently under construction!
# General Code Standards

This document outlines general guidelines for writing code at ProVal. These are overarching concepts that apply to all development, regardless of platform.

We want our work to function as expected, be testable, well composed, and easily parsed by other developers.

> ↩️ Standards for specific languages can be found in the respective language subfolders. Be sure to read this document before diving into other languages!

## Functionality
Your code should accomplish the task it was written for. A developer can manage major flaws and failures during the development phase without worry. However, releasing a project that does not accomplish its intended goal or does more than what would otherwise be apparent from the codebase and documentation will not be accepted.

> 🔎 John Smith enters an issue (#23) into the repository for `Get-Hamburger`, a PowerShell script that returns one or more hamburger emojis (🍔) based on a `-Count` parameter. John asked if it was possible to make a `-Height` parameter which would intelligently stack the hamburgers on individual lines. Nathan, a developer of the project, creates a branch (`feat/23-burger-stack`) and takes ownership of the issue.
>
> ✅ Nathan develops the feature, puts in a pull request, and awaits approval.
> 
> ✅ Nathan develops the feature along with another optional parameter: `-Width`. This parameter allows setting the width of the burger stack as well as the height. Nathan puts in a pull request and awaits approval.
> 
> ❌ Nathan develops the feature along with another optional parameter: `-Hotdog`. This parameter changes all of the hambuger emojis to hot dog emojis (🌭). Because the entire Get-Hamburger project is centered around hamburgers, this was an inappropriate addition. He should have created a new project for `Get-HotDog` instead.
>
> ❌ Nathan develops the feature and puts in a pull request. The reviewer finds that Nathan's code ignores the `-Count` parameter and prints out a vertical line of hamburgers equal to the `-Height` parameter. This was not the intention of the request, and the PR was sent back to Nathan with changes requested.
>
> ❌ Nathan develops the feature along with another optional parameter: `-Cheese`. This parameter adds a cheese emoji (🧀) next to all of the hambuger emojis. Because chesse is indeed related to a project centered around hamburgers, this was an appropriate addition, but not for this issue. He should have created a new issue and branch for adding this feature instead.

## Validation


## Composition


## Readability

## Security
[//]: # "Avoiding injection"

[//]: # "https://www.youtube.com/watch?v=CFRhGnuXG-4 Use this video somewhere"
