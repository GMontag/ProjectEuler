$string = ([bigint]::Pow(2,1000)).ToString()

$sum = 0

for ($i = 0; $i -lt $string.Length; $i++) {
    $sum += [int]"$($string[$i])"
}

Write-Output $sum