@echo off
title A5-A11 Blob Saver
color 0a
cd..
cd src
set udid=ideviceinfo
>udid.txt (
%udid%
findstr /R UniqueDeviceID: udid.txt > udidoutput.txt
)
set /p udid1=<udidoutput.txt
set udidresult=%udid1:~16,40%
ideviceenterrecovery %udidresult%
del udid.txt
del udidoutput.txt