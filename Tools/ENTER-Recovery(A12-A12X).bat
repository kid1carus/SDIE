@echo off
title A12-A12X Blob Saver
color 0a
cd..
cd src
set udid=ideviceinfo
>udid.txt (
%udid%
findstr /R UniqueDeviceID: udid.txt > udidoutput.txt
)
set /p udid1=<udidoutput.txt
set udidresult=%udid1:~16,25%
ideviceenterrecovery %udidresult%
del udid.txt
del udidoutput.txt
echo Successfully ENTERED recovery! Press any key on your keyboard to exit!
pause >nul