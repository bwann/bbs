@echo off

REM Weekly wcPACK task to purge deleted messages from
REM conference 0. Monday sounds good.
REM This will put all nodes into maintenance mode, wait up to an hour
REM with WCWAIT.EXE before trying to run wcPackX. Taken from example
REM in WC!4 Sysop guide.
REM
REM Results logged to C:\WILDCAT\WCPACK.LOG
REM
REM Notes:
REM - wcPACK can't pack conference #0 until all nodes are down
REM - wcPACK also can't renumber messages until all nodes are
REM   down because it needs exclusive access to the message and
REM   user database to update pointers. Renumbering shouldn't be
REM   needed until 65k messages have been posted to a conference.
REM - wcpackx uses XMS memory


REM Stop inbound telnet
CD \NETFOSS
RENAME WAIT.SE_ WAIT.SEM

REM Tell all nodes to drop to maintenance mode
CD \WILDCAT
wcnode /r /a

wcwait /r:60
IF ERRORLEVEL 0 GOTO SENDIT
IF ERRORLEVEL 1 GOTO ABORT
IF ERRORLEVEL 2 GOTO NOGO

:NOGO
C:\WILDCAT\UTILS\SHOWDT\SHOWDT.EXE >> \wildcat\wcpack.log
ECHO "*** wcWait gave up waiting for nodes to go down" >> \wildcat\wcpack.log
GOTO END


:ABORT
ECHO "*** Batch file aborted, bringing nodes back online"
GOTO END


:SENDIT
wcpackx /i 0


:END
REM Take nodes out of maintenance no matter what
wcnode /w /a
CD \NETFOSS
RENAME WAIT.SEM WAIT.SE_
CD \WILDCAT
