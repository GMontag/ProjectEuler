class PrimeSieve {
    [System.Collections.ArrayList]$sieve
    [int]$highestPrimeFound

    PrimeSieve() {
        $this.sieve = [System.Collections.ArrayList](2..100)
        $this.highestPrimeFound = 1
    }

    [int]NextPrime([int]$n) {
        $sieveEnd = $this.sieve[-1]
        if ($n -gt $sieveEnd) { 
            $this.sieve.AddRange(($sieveEnd+1)..$n)
        }
        if ($n -lt $this.highestPrimeFound) {
            $index = $this.sieve.IndexOf($n)
            return $this.sieve[$index + 1]
        }
        

    }

    [bool]IsPrime([int]$n) {

    }

}

function IsDivisor {
    param(
        [int]$divisor,
        [int]$dividend
    )

    return (($divisor -le $dividend) -and ($dividend % $divisor -eq 0))
}

function CountDivisors {
    param(
        [int]$n
    )

    $nsqrt = [math]::Sqrt($n)
    $count = 0
    for ($i = 1; $i -le $nsqrt; $i++) {
        if (IsDivisor $i $n) {
            if ($i -eq $nsqrt) {
                $count++
            } else {
                $count += 2
            }
        }
    }
    return $count
}

function PrimeFactorization {
    param(
        [int]$n
    )


}

function TriangularNumber {
    param(
        [int]$n
    )

    return ($n * ($n+1))/2
}

$i = 1
$found = $false
while (-not $found) {
    $triangle = TriangularNumber $i
    $divisorCount = CountDivisors $triangle
    if ($i % 100 -eq 0) { Write-Output "$triangle`t`t$divisorCount" }
    if ($divisorCount -gt 500) { $found = $true }
    $i++
}

Write-Output $triangle