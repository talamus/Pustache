# Pustache

Mustache for Powershell using [Nustache](https://github.com/jdiamond/Nustache).

### Example

```powershell
# PS> git clone https://github.com/talamus/Pustache.git

# Force module re-loading (while we are testing things)
try {
    Remove-Module Pustache
} catch {}

# Load module
Import-Module $PSScriptRoot\Pustache\Pustache.psm1

# From Powershell objects:
$out = (Invoke-Nustache "Hello {{name}}!" @{ "name" = "World" })
Write-Output $out

# From JSON strings:
$json = '{ "kissa": 123 }'
$out = (Invoke-Nustache 'Number {{kissa}}!' $json)
Write-Output $out

# From complex external files:
$template = (Get-Content -Raw -Path 'template.txt')
$json = (Get-Content -Raw -Path 'data.json')
$out = (Invoke-Nustache $template $json)
Write-Output $out
```
