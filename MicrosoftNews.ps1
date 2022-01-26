$hookUrl = 'https://discordapp.com/api/webhooks/930814014425006140/oktV16m1AtRcdGqj2HIpt0cI3UefZoRlEU941RyHwEkBwWKAGvlOh8me0aHzcV65I7ek'

$today_date = (Get-Date)
$response = Invoke-WebRequest -Uri "https://news.microsoft.com/recent-news/"
$format_date = "$($today_date.Year)/0$($today_date.Month)/$($today_date.Day)"

$news = $response.Links | Where {$_.href -like "*$($format_date)*"} | select href

if (-not ($news -eq $null)) {

    $content = @"

    This is the latest microsoft news for $($today_date.Day)/$($today_date.Month)/$($today_date.Year)! 
    $([string]$news.href)


"@

    $payload = [PSCustomObject]@{

        content = $content
        username = "Microst News Webhook"
        avatarURL = "https://imgur.com/NQwePGr"
    }
    $content
    Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'
}
else{

    $content = @"

    There is no new Microsoft news yet available for $(Get-Date). I will check again later!


"@

    $payload = [PSCustomObject]@{

        content = $content
        username = "Microst News Webhook"
        avatarURL = "https://imgur.com/NQwePGr"

    }
    $content
    Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'
}
