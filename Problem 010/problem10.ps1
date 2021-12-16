$sieve = @($true) * 2000000
$sieve[0] = $false
$sieve[1] = $true
$sum = 0
for ($i = 2; $i -lt 2000000; $i++) {
    if ($sieve[$i]) {
        $sum += $i
        for ($j = $i + $i; $j -lt 2000000; $j += $i) {
            $sieve[$j] = $false
        }
    }
}

$sum