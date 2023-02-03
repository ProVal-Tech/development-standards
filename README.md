# ProVal Tech Development Standards
The set of documents in this repository define standards for code and documentation at ProVal. These are standards that we expect our developers to learn, understand, and adhere to. They strive to be as objective as possible while still allowing for creativity in problem solving.

We ought to make sure that when writing documentation our users find it professional, easy to understand, and quickly answers their questions about the related content.

When writing code, we should make it as easy as possible for our fellow developers to follow along with our logic and don't have to ask questions like:

> "Why is the variable `$a` not named `$users`?"

If you have any concerns or questions about these standards or how they should be implemented, [open an issue](https://github.com/ProVal-Tech/development-standards/issues)! We are always looking for feedback on how to better guide our peers towards success.

> ❓ Why markdown?
>
> 💡 [Markdown](https://en.wikipedia.org/wiki/Markdown) is ubiquitous in the development world, and we are part of that world. Markdown syntax is easy to understand and learn. It is also ultimately just plain text, making it supremely portable. This portability allows us to display our documents across a wide spectrum of applications.
> 
> To start learning Markdown, check out the excellent open-source [Markdown Guide](https://www.markdownguide.org/).
> 
> ProVal's standard format is [GitHub Flavored Markdown](https://github.github.com/gfm/). Once you're comfortable with the basics, check out the documentation for it.

## Navigating the Documents

### Quick Links
- [General Code Standards](./CODE.md)
- [General Documentation Standards](./DOCUMENTATION.md)
- [ConnectWise Automate](./cwa)
- [PowerShell](./powershell)
- [Kaseya VSA](./vsa)

### Folder Structure
This repository is organized by platform, and (if necessary) by subtype. The general structure will be:

```
development-standards
│  README.md
│  CODE.md
│  DOCUMENTATION.md
│
├─── cwa
│   │   README.md
│   │
│   ├─── scripts
│   │      README.md
│   │      CODE.md
│   │      DOCUMENTATION.md
│   │      Example.xml
│   │      Example.md
│   │
│   ├─── dataviews
│   │      README.md
│   │      CODE.md
│   │      DOCUMENTATION.md
│   │      Example.xml
│   │      Example.md
│   ...
│
├─── powershell
│      README.md
│      CODE.md
│      DOCUMENTATION.md
│      Example.ps1
│      Example.md
│
├─── vsa
│   │   README.md
│   │
│   ├─── agent-procedures
│   │      README.md
│   │      CODE.md
│   │      DOCUMENTATION.md
│   │      Example.xml
│   │      Example.md
│   │
│   ├─── views
│   │      README.md
│   │      CODE.md
│   │      DOCUMENTATION.md
│   │      Example.jpg
│   │      Example.md
│   │
│   ...
│
...
```

### Emoji Notation

Throughout this repository's documents, emoji will be used to notate certain areas of interest. These emoji will always have a contextual explanation of their inclusion.

Emoji notes will always be contained in a quote block to separate them thematically from the actual standards. Think of them as helpful interjections as you read through.

>❗The following examples do not necessarily reflect accurate standards.
#### Examples

##### Example 1
When writing PowerShell functions, you should follow the proper casing structure for cmdlets.

> ✅ `Get-Widgets`
> 
> ❌ `get-widgEts`

##### Example 2
When creating a new piece of code or updating existing code, developers should always work against an issue with an associated branch.

> ❓ What if there isn't an existing issue for my work?
>
> 💡 Create one! Issues allow proposed changes to have their own conversations, and will also allow linking to issues across repos.

#### Emojis
| Emoji | Explanation                                          |
| :---: | :--------------------------------------------------- |
|   ✅   | Correct example of a standard                        |
|   ❌   | Incorrect example of a standard                      |
|   ❓   | Common question about a standard                     |
|   💡   | Answer to a common question about a standard         |
|   ❗   | Important note to consider before continuing to read |
|   ↩️   | Redirection to another part of the documentation     |
|   🚧   | Standard is currently under construction             |
|   ⚔️   | Standard is being debated                            |
|   🔎   | A case study example                                 |