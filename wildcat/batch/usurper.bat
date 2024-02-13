@ECHO OFF

REM This does not support modem users or local nodes (yet)

REM
REM BATCH FILE FOR USURPER
REM   This is a sample of a batch file to be used
REM   in a multinode Setup
REM   %1 is the Node Number which can be passed to the
REM   batch file from the BBS software.
REM   (With RemoteAccess BBS software, this can be accomplished by
REM   placing *N on the command line in ; execute Sub-program)
REM
REM /N1 tells Usurper that it's firing up on node 1. 
REM  This switch is only necessary when node information is not
REM  available from dropfile.    
REM
REM /P{path to dropfile} tells Usurper where to look for dropfile.
REM  Look in SYSOP.DOC for more command line options and batc file
REM  examples. 
REM

cd\doors\usurper

REM Goofy hack to work with Netfoss/NFU because Usurper wants to be in its
REM directory when it starts

c:\netfoss\nfu C:\WILDCAT\WCWORK\NODE%WCNODEID% "C:\WILDCAT\BATCH\USURPER2.BAT %wcnodeid%"

