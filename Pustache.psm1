function Get-ScriptDirectory {
	$invocation = (Get-Variable MyInvocation -Scope 1).Value
	Split-Path $invocation.MyCommand.Path
}

[Reflection.Assembly]::LoadFile((Join-Path (Get-ScriptDirectory) "\lib\Nustache.Core.dll"))
function Invoke-Nustache($template, $data) {
    return [Nustache.Core.Render]::StringToString($template, (ConvertTo-Dictionary $data))
}

function ConvertTo-Dictionary($data) {
    if ($data.GetType() -ne [string]) {
        $data = ($data | ConvertTo-Json)
    }
    $parser = New-Object Web.Script.Serialization.JavaScriptSerializer
    $parser.MaxJsonLength = $data.length
    $parser.DeserializeObject($data)
}
