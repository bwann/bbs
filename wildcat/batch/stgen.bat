@echo off

REM For STGEN-MC (Modified STGEN.EXE that calls USRSTAT) to display
REM modem statistics from our modems to caller
REM
REM Needs ATS02=43 and S14=0 set on our modems so door can grab attention
REM (and not hang up) and send AT commands to get USR statistics

REM Not supported if we're a telnet client
IF %WCMDM%==TELNET GOTO TELNET

REM clear up some env space, silly Windows
SET WINDOWS_TRACING_LOGFILE=
SET LYNX=
SET LYNX_CFG=

REM Set STGTMP env variable to Wildcat's node work directory so it can
REM pick up DOOR.SYS (using STG-MC). Caller reports are also written here.
REM Remember trailing slash!

SET STGTMP=C:\WILDCAT\WCWORK\NODE%WCNODEID%\

cd \doors\stgen

REM Detect if we're using a direct or fossil MDM profile
IF %WCMDM%==USRDSF GOTO FOSSIL

REM NFPORT is our NetFoss port number, write to stgen.log for debugging
REM If we had Caller-id info we could pass it as the 2nd argument to
REM STGEN-MC

:SERIAL
STGEN-MC %WCPORTID% %WCIRQID% %WCNODEID% 43 0 c:\doors\stgen\stgen.log /M3
GOTO END

:FOSSIL
STGEN-MC %NFPORT% 0 %WCNODEID% 43 1 c:\doors\stgen\stgen.log /M3
GOTO END

:TELNET
:END
