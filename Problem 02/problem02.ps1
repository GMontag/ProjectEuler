$previous = 1
$current = 1
$sum = 0
while ($current -lt 4000000) {
    if ($current % 2 -eq 0) { $sum += $current }
    $next = $current + $previous
    $previous = $current
    $current = $next
}

Write-Output $sum