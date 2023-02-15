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
    if ($divisorCount -gt 500) { $found = $true }
    $i++
}

Write-Output $triangle