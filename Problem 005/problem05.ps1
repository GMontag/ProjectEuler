function Get-Gcd {
    param([int]$a, [int]$b)
    while ($b -ne 0) {
        $temp = $b
        $b = $a % $b
        $a = $temp
    }
    return $a
}

$number = 2
for ($i = 2; $i -le 20; $i++) {
    if ($number % $i -ne 0) {
        $number *= ($i / (Get-Gcd $number $i))
    }
}

Write-Output $number