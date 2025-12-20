Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias -Name cd -Value z

Register-ArgumentCompleter -CommandName z -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete) 
    Search-NavigationHistory $commandName -List | ForEach-Object{ $_.Path} | ForEach-Object {
        New-Object -Type System.Management.Automation.CompletionResult -ArgumentList $_,
        $_,
        "ParameterValue",
        $_
    }
}

Invoke-Expression (&starship init powershell)
function Invoke-Starship-PreCommand
{
    Update-NavigationHistory $pwd.Path
    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $prompt = "$([char]27)]9;12$([char]7)"
    if ($loc.Provider.Name -eq "FileSystem")
    {
        $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    $host.ui.Write($prompt)
}
fnm env --use-on-cd --shell power-shell | Out-String | Invoke-Expression
