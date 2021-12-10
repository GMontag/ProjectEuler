function Test-Palindrome {
    param([int]$number)

    $string = "$number"
    $isPalindrome = $true
    $stringmiddle = [Math]::Ceiling($string.Length/2)
    for ($i = 0; $i -lt $stringmiddle; $i++) {
        if ($string[$i] -ne $string[$string.Length - $i - 1]) {
            $isPalindrome = $false
            break
        }
    }
    return $isPalindrome
}

$largest = 0
for ($i = 100; $i -lt 1000; $i++) {
    for ($j = 100; $j -lt 1000; $j++) {
        $product = $i * $j
        if ( ($product -gt $largest) -and (Test-Palindrome $product) ) {
            $largest = $product
        }
    }
}

Write-Output $largest