class PrimeSieve {
    [System.Collections.ArrayList]$sieve
    [int]$sievepos
    hidden static [int]$sieveSize = 1000

    PrimeSieve() {
        $this.sieve = [System.Collections.ArrayList](2..[PrimeSieve]::sieveSize)
        $this.sievepos = 0
    }

    [int]FindNextPrime() {
        if ($this.sievepos -eq ($this.sieve.Count - 1)) { $this.ExtendSieve() }
        $curprime = $this.sieve[$this.sievepos]
        for ($i = $this.sievepos + 1; $i -lt $this.sieve.Count; $i++) {
            if ($this.sieve[$i] % $curprime -eq 0) {
                $this.sieve.RemoveAt($i)
                $i--
            }
        }
        $this.sievepos++
        return $curprime
    }

    [int]FindNextPrime([int]$n) {
        if ($n -lt $this.sieve[$this.sievepos]) {
            $i = 0
            while ($this.sieve[$i] -le $n) { $i++ }
            return $this.sieve[$i]
        } else {
            $curprime = $this.sieve[$this.sievepos]
            while ($curprime -le $n) {
                $this.FindNextPrime()
                $curprime = $this.sieve[$this.sievepos]
            }
            return $curprime
        }
    }

    [void]ExtendSieve() {
        $lastnum = $this.sieve[-1]
        $lastpos = $this.sieve.Count - 1
        $this.sieve.AddRange(($lastnum+1)..($lastnum+([PrimeSieve]::sieveSize)))
        for ($i = 0; $i -lt $this.sievepos; $i++) {
            $curprime = $this.sieve[$i]
            for ($j = $lastpos + 1; $j -lt $this.sieve.Count; $j++) {
                if ($this.sieve[$j] % $curprime -eq 0) {
                    $this.sieve.RemoveAt($j)
                    $j--
                }
            }
        }
    }

    [bool]IsPrime([int]$n) {
        while ($n -gt $this.sieve[$this.sievepos]) {$null = $this.FindNextPrime() }
        if ($this.sieve.IndexOf($n,0,$this.sievepos+1) -eq -1) { return $false } else { return $true }
    }

    [void]ResetSieve() {
        $this.sieve = [System.Collections.ArrayList](2..[PrimeSieve]::sieveSize)
        $this.sievepos = 0
    }
    
}

class Factorizer {
    [System.Collections.Hashtable]$factorizations
    [PrimeSieve]$sieve

    Factorizer() {
        $this.factorizations = [System.Collections.Hashtable]@{}
        $this.sieve = [PrimeSieve]::new()
    }

    [System.Collections.Hashtable]PrimeFactorization([int]$n) {
        if ($this.factorizations[$n]) { return $this.factorizations[$n] }
        $factorization = [System.Collections.Hashtable]@{}
        $remainder = $n
        $curprime = 2
        while ($remainder -gt 1) {
            if ($remainder % $curprime -eq 0) {
                $remainder /= $curprime

                if (-not $factorization[$curprime]) { $factorization[$curprime] = 0}
                $factorization[$curprime]++

                if ($this.factorizations[$remainder]) {
                    foreach ($prime in $this.factorizations[$remainder].Keys) {
                        if (-not $factorization[$prime]) { $factorization[$prime] = 0 }
                        $factorization[$prime] += $this.factorizations[$remainder][$prime]
                    }
                    $remainder = 1
                }
            } else {
                $curprime = $this.sieve.FindNextPrime($curprime)
            }
        }
        $this.factorizations[$n] = $factorization
        return $factorization
    }

    [int]DivisorCount([int]$n) {
        $primefactors = $this.PrimeFactorization($n)
        $totaldivisors = 1
        foreach ($exponent in $primefactors.Values) { $totaldivisors *= ($exponent + 1) }
        return $totaldivisors
    }
}

$i = 1
$found = $false
$factorizer = [Factorizer]::new()
while (-not $found) {
    #Write-Host "Testing triangle number $i" -NoNewline
    if ($i % 2 -eq 0) {
        $count1 = $factorizer.DivisorCount($i/2)
        $count2 = $factorizer.DivisorCount($i+1)
    } else {
        $count1 = $factorizer.DivisorCount($i)
        $count2 = $factorizer.DivisorCount(($i+1)/2)
    }
    $totalcount = $count1 * $count2
    if ($totalcount -gt 500) { $found = $true } else { $i++ }
    #Write-Host "`t$totalcount factors"
}
Write-Output ($i * ($i+1) / 2)