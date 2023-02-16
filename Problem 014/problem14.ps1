$collatzsteps = @{}

$collatzsteps[1] = 0

$longeststeps = 0
$longeststart = 0 

for ($start = 2; $start -lt 1000000; $start++) {
    $n = $start
    $steps = 0
    while ($n -ne 1) {
        if ($collatzsteps[$n]) {
            $steps += $collatzsteps[$n]
            break
        }
        if ($n % 2 -eq 0) { $n /= 2 } else { $n *= 3; $n++ }
        $steps++
    }
    $collatzsteps[$start] = $steps
    if ($steps -gt $longeststeps) {
        $longeststeps = $steps
        $longeststart = $start
    }
}

Write-Output $longeststart