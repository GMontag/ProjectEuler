$lines = Get-Content .\input.txt
for ($i = 0; $i -lt $lines.Count; $i++) {
    $lines[$i] = $lines[$i] -split ' ' | % { [int]$_ }
}

for ($i = $lines.Count - 2; $i -gt 0; $i--) {
    for ($j = 0; $j -lt $lines[$i].Count; $j++) {
        $lines[$i][$j] += ( ($lines[$i+1][$j] -gt $lines[$i+1][$j+1]) ? $lines[$i+1][$j] : $lines[$i+1][$j+1] )
    }
}

$lines[0] += ( ($lines[1][0] -gt $lines[1][1]) ? $lines[1][0] : $lines[1][1] )

Write-Output $lines[0][0]