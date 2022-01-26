
Param(
    [bool]$nq,
    [bool]$notify
)

$Header = @{

    'X-CMC_PRO_API_KEY' = 'API_KEY' #reference your API key here
}
    
    
$Uri = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"

    
if ($nq){
    $request = (Invoke-WebRequest -Uri $Uri -Headers $Header | ConvertFrom-Json -Depth 5).data
    $request | ConvertTo-Json -Depth 5 > .\data.json
}

$data = Get-Content .\data.json -Raw | ConvertFrom-Json -Depth 5
$BTC_data = $data | Where-Object symbol -EQ "BTC"
$BTC_price = "$" + [math]::Round($BTC_data.quote.USD.price,2)
$ETH_data = $data | Where-Object symbol -EQ "ETH" 
$ETH_price = "$" + [math]::Round($ETH_data.quote.USD.price,2) 

if($notify){
    
    function ShowBalloonTipInfo 
{
 
[CmdletBinding()]
param
(
[Parameter()]
$Text,
 
[Parameter()]
$Title,
 

$Icon = 'Info'
)
 
Add-Type -AssemblyName System.Windows.Forms
 

if ($script:balloonToolTip -eq $null)
{

$script:balloonToolTip = New-Object System.Windows.Forms.NotifyIcon 
}
$icon_path = $PWD + "\btc.ico"
$balloonToolTip.Icon = [System.Drawing.Icon]$icon_path
$balloonToolTip.BalloonTipIcon = $Icon
$balloonToolTip.BalloonTipText = $Text
$balloonToolTip.BalloonTipTitle = $Title
$balloonToolTip.Visible = $true
 

$balloonToolTip.ShowBalloonTip(1000)
}
 
ShowBalloonTipInfo ("Latest Crypto Prices you care about: ", "$($BTC_price) $($ETH_price)")
}

