@echo off
title A5-A11 Blob Saver
color 0a
cd..
cd..
cd src
set udid=ideviceinfo
>udid.txt (
%udid%
findstr /R UniqueDeviceID: udid.txt > udidoutput.txt
findstr /R UniqueChipID: udid.txt > ecidoutput.txt
findstr /R HardwareModel: udid.txt > boardconfig.txt
)
set /p udid1=<udidoutput.txt
set udidresult=%udid1:~16,40%
set /p ecid1=<ecidoutput.txt
set ecidresult=%ecid1:~14,16%
ideviceenterrecovery %udidresult%
timeout 30
set nonc=irecovery -q
>nonc.txt (
%nonc%
findstr /R NONC: nonc.txt > noncoutput.txt
)
@echo IMPORTANT INFO: The UniqueDeviceID is the UDID. The UniqueChipID is the ECID. The NONC is the APNONCE. The HardwareModel is the Board Configuration> keys.txt
@echo IMPORTANT INFO (continued): The ECID is shown as a decimal value. Go to https://bit.ly/2HMNO4m and convert it to a hexadecimal value which is NEEDED to save blobs> hex.txt
type udidoutput.txt ecidoutput.txt noncoutput.txt boardconfig.txt keys.txt hex.txt > A5-A11-Output.txt
clip < A5-A11-Output.txt
del udid.txt
del udidoutput.txt
del nonc.txt
del noncoutput.txt
del ecidoutput.txt
del hex.txt
del keys.txt
del boardconfig.txt
del A5-A11-Output.txt
cd..
cd SILENT
powershell -command "Get-Clipboard" > A5-A11-Output.txt
echo off | clip
cd..
cd src
irecovery -n
cd..
cd SILENT
start A5-A11-Output.txt