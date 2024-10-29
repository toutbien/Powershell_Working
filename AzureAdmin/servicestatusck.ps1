
# Get the VDS service
$vds = Get-Service -Name "VDS"

# Check if the service is not running
if ($vds.Status -ne "Running") {
    Write-Host "VDS is not running. Starting the service..."
    Start-Service -Name "VDS"
}

# Run diskpart and capture the output
$result = diskpart.exe /? 2>&1

# Check if the result contains the failure message
if ($result -like "*The service failed to initialize.*") {
    Write-Host "VDS is in a failed state."
}
 #handle cases where the service fails to start, you can add error handling after Start-Service
if ($vds.Status -ne "Running") {
    Write-Host "VDS is not running. Starting the service..."
    Start-Service -Name "VDS" -ErrorAction Stop
    if ((Get-Service -Name "VDS").Status -ne "Running") {
        Write-Host "Failed to start VDS service."
    }
}
