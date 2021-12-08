$number = 600851475143

$i = 2
while ($number -ne $i) {
    if ($number % $i -eq 0) {
        $number /= $i
    } else {
        $i++
    }
}

Write-Output $i