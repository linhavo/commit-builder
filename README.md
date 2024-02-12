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
#### Add to PATH
1. *Optional:* Move the file to desired location, for example: `Documents\WindowsPowerShell\Scripts`
2. Copy path to script.
3. Search `Edit the system environment variables`
4. Open `Environment variables`
5. Select `Path` in user variables
   * Edit -> New -> Paste copied path to script
6. Done. You can now call this from whenever `commit_builder.ps1`


### Linux - Bash
1. Download `commit_builder.sh`.
2. Open your terminal and navigate to the directory where `commit_builder.sh` is downloaded.
3. Give execute permission to the script by running `chmod +x commit_builder.sh`.

## Usage

1. In your terminal, execute the script by running `./commit_builder.sh`.
2. Follow the prompts to go through Action, Scope, and Message.
   - If you are not sure what action to choose, enter `h` for help.
3. If everything is correct, your changes will be successfully committed.

## Adding to PATH (Optional)

1. Move the script to a desired location, for example: `~/scripts`.
2. Add the path to the script to your PATH variable:
   - Open your `~/.bashrc` or `~/.zshrc` file in a text editor.
   - Add the following line: `export PATH="$PATH:/path/to/your/script/folder"`.
   - Replace `/path/to/your/script/folder` with the actual path to your script.
3. Save the file and reload your shell configuration with `source ~/.bashrc` or `source ~/.zshrc`.
4. Now you can run `commit_builder.sh` from any directory in your terminal.

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
