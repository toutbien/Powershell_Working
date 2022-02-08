$Uri = "https://www.brainyquote.com/quote_of_the_day"

$response = Invoke-WebRequest -Uri $Uri
$quote = ($response.ParsedHtml.getElementsByTagName("div") | where {$_.ClassName -eq "grid-item qb clearfix bqQt"}).innerText | Where {$_ -like "Quote of the Day*"} 
$quoteArray = $quote -split "`n" | % { $_.trim()}
$quoteOfTheDay = $quoteArray[2]
$quoteAuthor = "-" + $quoteArray[3]
$OutPut = @"
Quote Of The Day

$($quoteOfTheDay)
    $($quoteAuthor)
"@

$OutPut > C:\Users\Administrator\Desktop\QuoteOfTheDay.txt