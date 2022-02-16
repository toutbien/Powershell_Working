$dir = $env:USERPROFILE + "\Documents\dupdownloadstest"
$dupdownloads = Get-ChildItem -Path $dir | where {$_.Name -match '[(\d)].txt'} 

if (-not (Test-Path "duplicates.csv")){
    New-Item "duplicates.csv" | Add-Content -Value '"File Name", " File Size", "Created On"'
    
}
$output = @()

foreach ($item in $dupdownloads){

    $output += [PSCustomObject]@{
        'File Name' = $item.Name
        'File Size' = $item.Length
        'Created On' = $item.CreationTime
    }
}
$output | Export-Csv ".\duplicates.csv"
$filesToDelete = Import-Csv ".\duplicates.csv" 

write-host @"
Files to be deleted:
$($filesToDelete.'File Name')
"@
$response = Read-Host "Do you want to delete duplicate files? Y/N"

if ($response -eq "Y" -or $response -eq "y"){
    foreach ($item in $dupdownloads){
    Remove-Item -Path $item
    Write-Host "I removed $($item.Name) file"
} 
}

else{

    Exit 
}