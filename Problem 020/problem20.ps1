$bigint = [bigint]1

for ($i = 2; $i -le 100; $i++) { $bigint *= $i }

$bigintstring = $bigint.ToString()

$total = 0

for ($i = 0; $i -lt $bigintstring.Length; $i++) { $total += [int][string]$bigintstring[$i] }

Write-Host $total