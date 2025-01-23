@ECHO OFF
REM
REM Batch script to run Qmodem over and over again with a test script
REM

REM Delete any previous test files that were downloaded
IF EXIST \temp2\test*.dat DEL \temp2\test*.dat

REM Start Qmodem with the script we want to use
CD \qmodem
REM qmodem /s=\qm46td\scripts\dlnull.scr
qmodem /s=\qmodem\scripts\dl.scr

REM Pause 10 seconds to let modems and things to reset and give us a
REM chance to Ctrl-C break to stop the test.
choice Waiting... Ctrl-C to stop /ty,10

REM Start all over again
loop.bat
