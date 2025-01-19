@echo off

REM Node 2 - modem, Netfoss FOSSIL real COM6

SET WCNODEID=2

REM Tradewars
SET TWNODE=2

REM Netfoss node 2, COM6
SET NFNODE=2
SET NFPORT=6

REM US Robotics MDM profile w/ FOSSIL enabled
SET WCMDM=USRDSF

REM Load FOSSIL driver in COM port mode
C:\NETFOSS\NETFOSS /N%WCNODEID% /C%NFPORT%

CALL cmncat.bat

c:\netfoss\netfoss /U

echo This was WCNODEID %WCNODEID% NFPORT %NFPORT%

