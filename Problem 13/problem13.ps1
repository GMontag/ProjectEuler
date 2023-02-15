$in = Get-Content .\input.txt

$sum = [bigint]::new(0)

foreach ($line in $in) {
    $sum += [bigint]::Parse($line)
}

Write-Output $sum