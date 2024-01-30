# Emoji dictionary
# Conversion took from: https://sid-500.com/2022/02/02/characters-in-powershell/
$emoji = @{
    "Add"       = [char]::ConvertFromUtf32(0x2B50)  # ⭐
    "Refactor"  = [char]::ConvertFromUtf32(0x267B)  # ⚻
    "Configure" = [char]::ConvertFromUtf32(0x2699)  # ⚙
    "Remove"    = [char]::ConvertFromUtf32(0x1F4A5) # 💥
    "Test"      = [char]::ConvertFromUtf32(0x1F9EA) # 🧪
    "Optimize"  = [char]::ConvertFromUtf32(0x1F680) # 🚀
    "Document"  = [char]::ConvertFromUtf32(0x1F4C4) # 📄
    "Fix"       = [char]::ConvertFromUtf32(0x1FAB2) # 🪲
    "Style"     = [char]::ConvertFromUtf32(0x1F3A8) # 🎨
    "Celebrate" = [char]::ConvertFromUtf32(0x1F389) # 🎉
}

# Prompt for Action
$action = Read-Host "Enter Action (h for help)"

# If help, show help and exit
if ($action -eq "h") {
    Write-Host "Add       (a)  - $($emoji["Add"]) Add a new file"
    Write-Host "Refactor  (r)  - $($emoji["Refactor"]) Refactor existing code"
    Write-Host "Configure (c)  - $($emoji["Configure"]) Configure a setting"
    Write-Host "Remove    (rm) - $($emoji["Remove"]) Remove a file or setting"
    Write-Host "Test      (t)  - $($emoji["Test"]) Add or update tests"
    Write-Host "Optimize  (o)  - $($emoji["Optimize"]) Optimize code"
    Write-Host "Document  (d)  - $($emoji["Document"]) Add or update documentation"
    Write-Host "Fix       (f)  - $($emoji["Fix"]) Fix a bug"
    Write-Host "Style     (s)  - $($emoji["Style"]) Update style"
    Write-Host "Celebrate (cl) - $($emoji["Celebrate"]) Celebrate a milestone"
    $action = Read-Host "Enter Action"
}

# Switch action to full name
switch ($action) {
    "a" { $action = "Add" }
    "r" { $action = "Refactor" }
    "c" { $action = "Configure" }
    "rm" { $action = "Remove" }
    "t" { $action = "Test" }
    "o" { $action = "Optimize" }
    "d" { $action = "Document" }
    "f" { $action = "Fix" }
    "s" { $action = "Style" }
    "cl" { $action = "Celebrate" }
}

# Check if action is valid
$emojiAction = $emoji[$action]
if (-not $emojiAction) {
    Write-Error "Invalid action '$action'."
    exit
}

# Prompt for Scope
$scope = Read-Host "Enter Scope"

# Prompt for Message
$message = Read-Host "Enter Message"


# If no action or scope, exit
# Room for improvement: Prompt for action and scope
if (-not $action -or -not $scope) {
    Write-Error "No action, scope"
    exit
}

# If no message, prompt for message
if (-not $message) {
    # Prompt for message
    $confirm = Read-Host "No message included. Do you want to continue without a message? (y/n)"

    # While not y or n, prompt for message
    while ($confirm -ne "y" -and $confirm -ne "n") {
        $confirm = Read-Host "Do you want to continue without a message? (y/n)"
    }

    # If n, prompt for message
    if ($confirm -ne "y") {
        $message = Read-Host "Enter Message"
        $commitMessage = "$emojiAction ${scope}: $message"
    }
    else {
        # If y, use scope as message
        $commitMessage = "$emojiAction ${scope}"
    }
}
else {
    $commitMessage = "$emojiAction ${scope}: $message"
}

# Prompt for confirmation
$confirm = Read-Host "Commit? ($commitMessage) (y/n)"
while ($confirm -ne "y" -and $confirm -ne "n") {
    $confirm = Read-Host "Commit? (y/n)"
}
# If n, exit
if ($confirm -ne "y") {
    exit
}

# Commit using Git
# git commit -m $commitMessage
Write-Host "Committing with message: $commitMessage"

