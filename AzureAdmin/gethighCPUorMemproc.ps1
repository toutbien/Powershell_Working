#topCPU
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, Id, CPU, @{Name='Memory (MB)'; Expression={"{0:N2}" -f ($_.WorkingSet / 1MB)}}

#topMemory
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 Name, Id, @{Name='Memory (MB)'; Expression={"{0:N2}" -f ($_.WorkingSet / 1MB)}}, CPU


#To get a list of all processes along with their CPU and memory usage
#Get-Process: Retrieves all processes currently running on the system.
#Select-Object: Selects specific properties to display:
#Name: Name of the process.
#Id: Process ID.
#CPU (s): Total CPU time in seconds, formatted to two decimal places.
#Memory (MB): Working set size (memory usage) in megabytes, formatted to two decimal places.
#Sort-Object: Sorts the output by CPU usage in descending order
