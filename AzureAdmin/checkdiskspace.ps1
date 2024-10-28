# Get available disk space for all drives
Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Label='Used (GB)'; Expression={[math]::Round($_.Used / 1GB, 2)}}, @{Label='Free (GB)'; Expression={[math]::Round($_.Free / 1GB, 2)}}, @{Label='Total (GB)'; Expression={[math]::Round($_.Used / 1GB + $_.Free / 1GB, 2)}}
