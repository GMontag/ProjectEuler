function factorial {
    param (
        [int]$n
    )

    $result = [bigint]1

    for ($i = 2; $i -le $n; $i++) {
        $result *= $i
    }

    return $result
}

Write-Output ((factorial(40))/((factorial(20))*(factorial(20))))