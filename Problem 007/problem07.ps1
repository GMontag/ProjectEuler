$primes = [System.Collections.ArrayList]@()

function nextPrime() {
    $found = $false
    if ($primes.Count -gt 0) {
        $n = $primes[-1] + 1
    } else {
        $n = 2
    }
    while (-not $found) {
        $composite = $false
        foreach ($prime in $primes) {
            if ($n % $prime -eq 0) {
                $composite = $true
                break
            }
        }
        if (-not $composite) {
            $found = $true
            [void]$primes.Add($n)
        } else {
            $n++
        }
    }
    return $n
}

for ($i = 0; $i -lt 10001; $i++) {
    $answer = nextPrime
}

$answer