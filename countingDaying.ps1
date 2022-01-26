$hookUrl = 'https://discordapp.com/api/webhooks/930814014425006140/oktV16m1AtRcdGqj2HIpt0cI3UefZoRlEU941RyHwEkBwWKAGvlOh8me0aHzcV65I7ek'

$start=Get-Date
$end=([DateTime]'05-10-2022')
#define a counter
$days=0
#test every date between start and end to see if it is a weekend
for ($d=$start;$d -le $end;$d=$d.AddDays(1)){
if ($d.DayOfWeek -notmatch "Sunday|Saturday") {
#if the day of the week is not a Saturday or Sunday
#increment the counter
$days++
}
}
if ($start.Hour -gt 17){
    $days = $days - 1
}

$content = @"
This is a powershell script sent from toutbien's command center.
Starlog date and time information : $(Get-Date)
We have $($days) more days left!
I hope everyone has a great day today!
"@

$payload = [PSCustomObject]@{

    content = $content

}

Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'