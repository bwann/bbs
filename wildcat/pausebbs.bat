@echo off

REM Take the BBS down for maintenance, modems and telnet. WC nodes are
REM left running, but they busy out their modems and close database
REM connections.
REM
REM This frees us up to run things MAKEWILD and WCPACK to edit the BBS
REM or work on databases.
REM
REM Won't disconnect current callers.
REM
REM Warning: this is not idempotent! It's going to take action
REM one way or another each time it's run. Each run should re-set the
REM last operation.
REM
REM If things get stuck, you'll have to re-enable nodes by hand.


REM NetFoss looks for a semaphore file called wait.sem to enable/disable
REM new net2bbs connections.
cd \netfoss

IF EXIST wait.se_ GOTO PAUSE
IF EXIST wait.sem GOTO UNPAUSE

:UNPAUSE
echo Resuming incoming telnet connections
RENAME wait.sem wait.se_

echo Marking all nodes to wake up
cd \wildcat
wcnode /a /w
GOTO END

:PAUSE
echo Blocking incoming telnet connections
RENAME wait.se_ wait.sem

echo Marking all nodes as in-maintenance
cd \wildcat
wcnode /a /r
GOTO END

:END
cd \wildcat
