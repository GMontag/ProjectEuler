:outer for ($a = 1; $a -lt 1000; $a++) {
    :inner for ($b = $a+1; $b -lt (999 - $a)/2; $b++) {
        $c = 1000 - $a - $b
        if (($a * $a) + ($b * $b) -eq ($c * $c)) {
            break outer
        }
    }
}

Write-Output ($a * $b * $c)