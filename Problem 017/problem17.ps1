Import-Module PowershellHumanizer

$totalletters = 0
for ($i = 1; $i -le 1000; $i++) {
    $numstring = $i.ToWords()
    for ($j = 0; $j -lt $numstring.Length; $j++) {
        if ($numstring[$j] -match "[a-zA-Z]") { $totalletters++ }
    }
}

Write-Output $totalletters