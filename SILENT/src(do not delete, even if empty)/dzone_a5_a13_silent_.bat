cd..
cd..
cd src
set udid=ideviceinfo
>udid.txt (
%udid%
findstr /R UniqueDeviceID: udid.txt > udidoutput.txt
findstr /R UniqueChipID: udid.txt > ecidoutput.txt
findstr /R ProductType: udid.txt > identifier.txt
findstr /R HardwareModel: udid.txt > boardconfig.txt
)
set /p udid1=<udidoutput.txt
set udidresult=%udid1:~16,40%
ideviceenterrecovery %udidresult%
timeout 30
set nonc=irecovery -q
>nonc.txt (
%nonc%
findstr /R NONC: nonc.txt > noncoutput.txt
)
@echo This program was made by Laith Ayoub (aka FutureFlash). To view source code visit: https://github.com/laithayoub71/SDIE> credit.txt
@echo IMPORTANT INFO: The The UniqueDeviceID is the UDID. The UniqueChipID is the ECID. The NONC is the APNONCE. The HardwareModel is> keys.txt
@echo the BoardConfiguration. The ProductType is the Model Identifier> keys2.txt
@echo IMPORTANT INFO: The ECID is shown as a decimal value. When saving blobs using TSSSaver, click "Hex (iTunes)" and change it to "Dec (UDID Calculator/ideviceinfo)"> hex.txt
type credit.txt keys.txt keys2.txt udidoutput.txt ecidoutput.txt hex.txt noncoutput.txt boardconfig.txt identifier.txt > A5-A13-Output.txt
clip < A5-A13-Output.txt
del /q /f *.txt
cd..
cd SILENT
paste > A5-A13-Output.txt
echo off | clip
cd..
cd src
irecovery -n
cd..
cd SILENT
start A5-A13-Output.txt