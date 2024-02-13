@echo off
rem This file is an example batch file that should be run from your
rem Wildcat! HOME directory. This example will work for local logins
rem when using "autonode".
rem
SET WCNODEID=AUTO
SET WCPORTID=0
:RELOAD
C:
CD \WILDCAT
WILDCAT /L
rem Note - Available command lines can be accessed by
rem        typing "WILDCAT /?".
:END
@echo on
