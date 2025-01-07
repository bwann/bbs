@echo off

REM Extract FILE_ID.DIZ from uploaded archives and save to BBS
REM This is a hook that's automatically called from Wildcat! after
REM an upload.
REM
REM TODO: support ARC, LHZ archive files too someday

REM Clean up any existing description files in case Wildcat! missed
REM last time

IF EXIST FILE_ID.DIZ DEL FILE_ID.DIZ
IF EXIST DESC.SDI DEL DESC.SDI

\pkware\pkunzip %1 FILE_ID.DIZ DESC.SDI

