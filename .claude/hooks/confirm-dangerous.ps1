# PreToolUse hook: ask the user before Claude runs a dangerous shell command.
# Reads the hook payload (JSON) from stdin; prints an "ask" decision when the command matches.

$payload = [Console]::In.ReadToEnd() | ConvertFrom-Json
$command = $payload.tool_input.command
if (-not $command) { exit 0 }

# A "segment" is the rest of one command, up to ; | & or a newline.
$seg = '[^;|&\r\n]*'

$rules = [ordered]@{
    'recursive force delete (rm -rf)' = "\brm\b(?=$seg\s(-[a-z]*r|--recursive\b))(?=$seg\s(-[a-z]*f|--force\b))"
    'recursive delete (Remove-Item -Recurse)' = "\b(Remove-Item|ri|rmdir|rd|del|erase)\b$seg\s-Recurse\b"
    'DROP (TABLE / DATABASE / ...)' = '\bdrop(db)?\b'
    'git force push' = "\bgit\b$seg\bpush\b$seg(\s--force|\s-[a-z]*f[a-z]*\b|\s\+\S)"
}

foreach ($name in $rules.Keys) {
    # PowerShell -match is case-insensitive.
    if ($command -match $rules[$name]) {
        @{
            hookSpecificOutput = @{
                hookEventName            = 'PreToolUse'
                permissionDecision       = 'ask'
                permissionDecisionReason = "Dangerous command detected: $name"
            }
        } | ConvertTo-Json -Depth 3 -Compress
        exit 0
    }
}
exit 0
