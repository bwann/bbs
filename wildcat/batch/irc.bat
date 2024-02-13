@echo off

REM MannIRC door, Win32-based so it does not support modem users
REM Ran via Netfoss/NFU


REM set SOCKET=1

echo NFNODE %NFNODE%
echo SOCKET %SOCKET%

c:\netfoss\nfu C:\WILDCAT\WCWORK\NODE%WCNODEID% /L

cd \doors\mannirc
REM mannirc.exe -DC:\WILDCAT\WCWORK\NODE%WCNODEID%\door32.sys
c:\netfoss\nfu.exe c:\wildcat\wcwork\node%wcnodeid%\ "c:\doors\mannirc\mannirc.exe -DC:\WILDCAT\WCWORK\NODE%WCNODEID%\door32.sys"

