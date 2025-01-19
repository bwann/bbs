@echo off

REM Node 1 - modem, direct COM4, no FOSSIL driver
REM Used for testing.
REM Warning: doors for node 1 are still configured to expect a FOSSIL driver

SET WCNODEID=1
SET WCPORTID=4

REM Override COM4 settings
SET WCIRQID=3
SET WCBASEID=$02E8

REM Tradewars
SET TWNODE=1

REM US Robotics MDM profile
SET WCMDM=USRDS

CALL cmncat.bat

echo This was WCNODEID %WCNODEID% WCPORTID %WCPORTID%
