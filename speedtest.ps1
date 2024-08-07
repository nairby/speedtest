# speedtest.ps1
# 
# Capture output of Ookla CLI to a CSV file

# Configure as scheduled task

cd $PSScriptRoot

# TODO
# Check binary is downloaded
# Retrieve and unpack

$targ = "speedtest.csv"

# Run a speed test
$q = .\speedtest.exe -f csv --output-header | ConvertFrom-Csv

# Add time stamp
$q | Add-Member -NotePropertyMembers @{
    time = Get-Date
}

# TODO
# Date & time in separate fields
# Add hostname field
# Field ordering in CSV

# Creates the CSV if it doesn't exist
$q | Export-Csv $targ -Append -Encoding ascii
