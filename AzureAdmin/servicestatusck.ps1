 #handle cases where the service fails to start, you can add error handling after Start-Service

if ($vds.Status -ne "Running") {
    Write-Host "VDS is not running. Starting the service..."
    Start-Service -Name "VDS" -ErrorAction Stop
    if ((Get-Service -Name "VDS").Status -ne "Running") {
        Write-Host "Failed to start VDS service."
    }
}
