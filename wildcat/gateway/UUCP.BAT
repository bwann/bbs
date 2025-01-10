@echo off

REM Exchanging email with uucp.wann.net
REM
REM Note: for whatever reason sometimes UUCICO or the modem gets
REM gets confused when uucico tries to initalize the modem.
REM uucico or the modem is expecting output from the other and it
REM eventually just times out and runs out of retries. The UUCP
REM run is aborted, have to try again later. Maybe figure this out
REM someday, thank goodness nobody is paying us for this.


REM Export messages from Wildcat! to uucp spool directory
REM  "export messages destine for UUCP host wannnet"
cd \wildcat
wcgate export uucp host:wannnet V

REM Calling provider to exchange mail.
REM   "call the system named wannnet"
cd \wildcat\gateway
uucico -swannnet -V

REM If message import takes a long time, you can busy
REM out the phone line with FXAT.
REM
REM not really needed with how fast we go
REM \wildcat\gateway\fxat -H

REM Importing any new mail received from provider into Wildcat!
REM   "import email from system wannnet to message database"
cd \wildcat
wcgate import uucp h:wannnet V

REM Run bulletin generator, bulletin #52 is UUCP stats
REM NETBULL.EXE by Michael Conley, netbull.cfg is also in \wildcat dir
cd \wildcat
netbull.exe

REM Re-set the file timestamp of bulletin #52. This is going
REM to be updated several times a day, so don't nag the caller
REM every time with "check for new bulletin"
\wildcat\utils\touch /d:01/01/2024 c:\wildcat\bull\bull52.bbs
