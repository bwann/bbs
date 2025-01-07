@echo off
REM
REM Script for starting Wildcat from Netfoss
REM
REM In net2bbs.ini call this as:
REM Command=c:\netfoss\nf.bat /n*N /h*H c:\wildcat\runwild.bat *N *I
REM

echo %date% %time% 1:%1 2:%2 >> c:\netfoss\runwild.log

PATH=C:\WINDOWS\System32;C:\PKWARE;C:\ARJ;C:\LHA

set WCNODEID=%1
set NODEPATH=C:\WILDCAT\WCWORK\NODE%1

REM MDM profile for telnet 
set WCMDM=TELNET

REM Tradewars
set TWNODE=%1

cd\wildcat

REM Pass the IP address as the caller-id phone number
wildcat.exe /B 57600 CID:%2
