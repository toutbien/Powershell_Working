#get specific events from the Windows Event Log and format the output into a readable table

Get-WinEvent -FilterHashtable @{logname = 'System'; id = 41,1001,1074,1076,6005,6006,6008,6009,6013} -MaxEvents 10 | Format-Table -wrap

#41: Indicates that the system has rebooted without cleanly shutting down first.
#1001: Represents a bug check (blue screen) event.
#1074: Indicates that a system shutdown has been initiated by a process.
#1076: Indicates the reason for an unexpected shutdown.
#6005: Indicates that the Event Log service has been started.
#6006: Indicates that the Event Log service has been stopped.
#6008: Indicates an unexpected shutdown.
#6009: Indicates the system is booting, with details about the operating system version.
#6013: Indicates that the system has been idle for a specified amount of time.
