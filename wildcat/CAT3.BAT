@echo off

REM Node 3 - COM mode, Netfoss FOSSIL real COM7

REM physical modem mapping notes, used when netfoss not used
REM COM 3 - WCPORTID=3, WCIRQID=4, WCBASEID=$3E8
REM COM 4 - WCPORTID=4, WCIRQID=3, WCBASEID=$2E8

SET WCNODEID=3

REM Tradewars
SET TWNODE=3

REM Netfoss node 3, COM7
SET NFNODE=3
SET NFPORT=7

REM not used normally
REM SET WCPORTID=3
REM SET WCIRQID=4
REM SET WCBASEID=$3E8

SET WCMDM=USRDSF

c:\netfoss\netfoss /N%WCNODEID% /C%NFPORT%

CALL cmncat.bat

c:\netfoss\netfoss /U
echo This was WCNODEID %WCNODEID% NFPORT %NFPORT%
