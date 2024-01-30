# commit-builder
*Developed to make committing with emojis easy.*

Interactive commit message builder. Based on standard of [Jakub Profota](https://github.com/profojak). 
Documentation can be found [here](https://github.com/profojak). 

```
<action> <scope>: <message>
```

## Parts
### Action
Actions are referenced to emojis, which have specific use.
Currently supported actions are:
```
- Add       (a)  - ⭐ Add a new file
- Refactor  (r)  - ♻️ Refactor existing code
- Configure (c)  - ⚙️ Configure a setting
- Remove    (rm) - 🧪 Remove a file or setting
- Test      (t)  - 🚀 Add or update tests
- Optimize  (o)  - 📄 Optimize code
- Document  (d)  - 🪲 Add or update documentation
- Fix       (f)  - 🎨 Fix a bug
- Style     (s)  - 🎉 Update style
- Celebrate (cl) - 🎊 Celebrate a milestone
```

### Scope
Scope is reference onto folder/file, which has been affected.
Script does not write this for you, it's still your job.

### Message
This speaks for itself, you just write your message. 
*(Capital letter at first position is not yet checked)*

## Usage
### Windows - PowerShell
1. Download `commit_builder.ps`.
2. In your PowerShell execute `.\commit_builder.ps1`.
3. Go through Action, Scope and Message.
   1. If you are not sure what action to choose/call, use `h`
4. You have *(hopefully)* successfully committed.
### Linux - Bash
*not developed yet*

## Example
```
.\commit_builder.ps1
> Enter Action (h for help): a
> Enter Scope: root
> Enter Message: Add commit to the script
> Commit? (⭐ root: Add commit to the script) (y/n): y
```
### Result
```
> [develop e997d79] ⭐ root: Add commit to the script
```
