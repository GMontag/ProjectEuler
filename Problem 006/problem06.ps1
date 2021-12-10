function sumn {
    param([int]$n)
    return $n * ($n+1) /2
}

function sumn2 {
    param([int]$n)
    return $n * ($n + 1) * (2*$n + 1) / 6
}

$answer = (sumn 100) * (sumn 100) - (sumn2 100)
Write-Output $answer