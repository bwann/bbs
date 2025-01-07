@echo off

REM This is largely pristine except for speed fix

c:\netfoss\ansi.com
REM Slow down output a bit so it's more modem-ish
c:\netfoss\netfoss.com %1 /s20
rem ** If running a DOS based BBS (or Mystic), add " %1" to the end of above line **
if errorlevel 1 goto end
echo Starting netcom.exe %1 %2 %3 %4 %5 %6 %7 %8 %9 > c:\netfoss\nf.log
c:\netfoss\netcom.exe %1 %2 %3 %4 %5 %6 %7 %8 %9
c:\netfoss\netfoss.com /u
:end
                                    
