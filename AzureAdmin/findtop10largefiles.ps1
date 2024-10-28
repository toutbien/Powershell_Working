#must run from the subscription or VM
Get-ChildItem C:\ -Recurse -File -ErrorAction SilentlyContinue | 
Where-Object {
    $_.Length -gt 100MB -and 
    $_.DirectoryName -notlike '*Panther*' -and 
    $_.DirectoryName -notlike '*OneDrive*' -and 
    $_.FullName -notlike '*.exe' -and 
    $_.FullName -notlike '*.dll' -and 
    $_.FullName -notlike '*.wim'
} | 
Sort-Object Length -Descending | 
Select-Object -First 10 @{Label='Path'; Expression={$_.FullName}}, @{Label='Size'; Expression={"$([math]::Round($_.Length / 1MB, 2)) MB"}}
