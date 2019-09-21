@echo off
title ENTER Recovery (A5-A13) by FutureFlash
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