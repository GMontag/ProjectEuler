$startdate = Get-Date -Day 1 -Month 1 -Year 1901
$enddate = Get-Date -Day 31 -Month 12 -year 2000

$date = $startdate
$sundays = 0

while ($date -lt $enddate) {
    if ($date.DayOfWeek -eq "Sunday") { $sundays++ }
    $date = $date.AddMonths(1)
}

Write-Host $sundays