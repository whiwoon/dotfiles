# Managed by chezmoi. Edit with: chezmoi edit $PROFILE

# Keep user-local binaries first when present.
$localBin = Join-Path $HOME '.local\bin'
if (Test-Path $localBin) {
  $env:PATH = "$localBin;$env:PATH"
}

# Starship prompt.
if (Get-Command starship -ErrorAction SilentlyContinue) {
  Invoke-Expression (&starship init powershell)
}

# fzf defaults. Respect a user-provided value.
if (Get-Command fzf -ErrorAction SilentlyContinue) {
  if (-not $env:FZF_DEFAULT_OPTS) {
    $env:FZF_DEFAULT_OPTS = '--height 40% --layout=reverse --border --info=inline --cycle'
  }
}

# Directory listing aliases. Keep plain `ls` as PowerShell's native alias and use
# eza for human-facing convenience commands when it is installed.
if (Get-Command eza -ErrorAction SilentlyContinue) {
  function global:l { eza --icons=auto --group-directories-first @args }
  function global:ll { eza -la --icons=auto --git --group-directories-first @args }
  function global:la { eza -a --icons=auto --group-directories-first @args }
  function global:tree { eza --tree --icons=auto --group-directories-first @args }
} else {
  function global:l { Get-ChildItem @args }
  function global:ll { Get-ChildItem -Force @args }
  function global:la { Get-ChildItem -Force @args }
}

# Local, non-versioned machine overrides.
$localProfile = Join-Path $HOME 'Documents\PowerShell\Microsoft.PowerShell_profile.local.ps1'
if (Test-Path $localProfile) {
  . $localProfile
}
