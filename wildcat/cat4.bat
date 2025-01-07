@echo off

PATH=c:\windows\system32;C:\PKWARE;C:\ARJ;C:\LHA;c:\windows\system32

REM Node 4, X.25 - Null-modem direct serial connection to Cisco router to
REM handle inbound X.25 sessions or reverse telnet from router

REM #old# COM 5 - Lower built-in port

SET WCNODEID=4

REM Tradewars
SET TWNODE=4

REM Netfoss
SET NFNODE=4
SET NFPORT=5

rem SET WCPORTID=4
rem SET WCIRQID=3
rem SET WCBASEID=$2E8
rem SET WCMDM=CARD288F
rem SET WCMDM=USRDSF

REM Custom wcModem MDM file that uses FOSSIL, Ring Result, 38.4k DTE,
REM and janky RINGRING verbal code sent from the Cisco

SET WCMDM=X25RING

REM lock serial port speed at 38.4k
c:\netfoss\netfoss /N%WCNODEID% /C%NFPORT% /L38400

:RELOAD
C:
CD \WILDCAT
REM WILDCAT /B 115200MNP
REM no options to wildcat
WILDCAT
IF ERRORLEVEL 4 GOTO CHAT
IF ERRORLEVEL 3 GOTO MAIL
IF ERRORLEVEL 2 GOTO DOOR
IF ERRORLEVEL 1 GOTO RELOAD
GOTO END
:MAIL
CD \WILDCAT\WCWORK\NODE%WCNODEID%
\WILDCAT\WCMAIL
GOTO RELOAD
:CHAT
CD \WILDCAT\WCWORK\NODE%WCNODEID%
\WILDCAT\WCCHAT
GOTO RELOAD
:DOOR
IF EXIST C:\WILDCAT\WCWORK\NODE%WCNODEID%\EVENT.BAT GOTO EVENT
CD \WILDCAT\WCWORK\NODE%WCNODEID%
rem Note the "CALL" statement is used here no "CAT.BAT" is needed at the
rem end of your door batch files
CALL DOOR.BAT
GOTO RELOAD
:EVENT
CD \WILDCAT\WCWORK\NODE%WCNODEID%
rem Note the "CALL" statement is used here no "CAT.BAT" is needed at the
rem end of your event batch files
CALL EVENT.BAT
GOTO RELOAD
:END

c:\netfoss\netfoss /u
@echo on
