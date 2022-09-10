$in = Get-Content .\input.txt
$numbers = @(0) * $in.Length
for ($i=0; $i -lt $in.Length; $i++) {
    $numbers[$i] = $in[$i] -split " " | % { [int]$_ }
}

$answer = 0

# test horizontal
for ($i=0; $i -lt $numbers.Length; $i++) {
    for ($j=0; $j -lt ($numbers[$i].Length - 3); $j++) {
        $result = $numbers[$i][$j] * $numbers[$i][$j+1] * $numbers[$i][$j+2] * $numbers[$i][$j+3]
        if ($result -gt $answer) { $answer = $result }
    }
}

# test vertical

for ($i=0; $i -lt $numbers.Length - 3; $i++) {
    for ($j=0; $j -lt ($numbers[$i].Length); $j++) {
        $result = $numbers[$i][$j] * $numbers[$i+1][$j] * $numbers[$i+2][$j] * $numbers[$i+3][$j]
        if ($result -gt $answer) { $answer = $result }
    }
}

# test diagonal down right

for ($i=0; $i -lt $numbers.Length - 3; $i++) {
    for ($j=0; $j -lt ($numbers[$i].Length - 3); $j++) {
        $result = $numbers[$i][$j] * $numbers[$i+1][$j+1] * $numbers[$i+2][$j+2] * $numbers[$i+3][$j+3]
        if ($result -gt $answer) { $answer = $result }
    }
}

# test diagonal down left

for ($i=0; $i -lt $numbers.Length - 3; $i++) {
    for ($j=3; $j -lt ($numbers[$i].Length); $j++) {
        $result = $numbers[$i][$j] * $numbers[$i+1][$j-1] * $numbers[$i+2][$j-2] * $numbers[$i+3][$j-3]
        if ($result -gt $answer) { $answer = $result }
    }
}

Write-Output $answer