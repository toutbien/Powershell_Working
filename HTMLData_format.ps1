. .\CryptoProject.ps1
$BTC_html = Get-Content .\data.json -Raw | ConvertFrom-Json -Depth 5 | Where-Object symbol -eq "BTC" | ConvertTo-Html -Head "Bitcoin Prices" -As Table
#ConvertTo-Html (Get-Content .\data.json -Raw | ConvertFrom-Json -Depth 5 | Where-Object symbol -eq "ETH")  
$BTC_html 