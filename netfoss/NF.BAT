@echo off

REM I think this file is pretty stock? or did I modify it?

c:\netfoss\ansi.com
c:\netfoss\netfoss.com %1 /s20
rem ** If running a DOS based BBS (or Mystic), add " %1" to the end of above line **
if errorlevel 1 goto end
echo Starting netcom.exe %1 %2 %3 %4 %5 %6 %7 %8 %9 > c:\netfoss\nf.log
c:\netfoss\netcom.exe %1 %2 %3 %4 %5 %6 %7 %8 %9
c:\netfoss\netfoss.com /u
:end
                                    
