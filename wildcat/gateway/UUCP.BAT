@echo off

REM Exchanging email with uucp.wann.net

REM Export messages from Wildcat! to uucp spool directory
cd \wildcat
wcgate export uucp host:wannnet V

REM Calling provider to exchange mail.
cd \wildcat\gateway
uucico -swannnet -V

REM take phone off hook during import
REM not really needed with how fast we go
REM fxat -H

REM Importing any new mail received from provider into Wildcat!
cd \wildcat
wcgate import uucp h:wannnet V

REM Run bulletin generator
netbull.exe
