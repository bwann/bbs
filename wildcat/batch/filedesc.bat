@echo off

REM Extract FILE_ID.DIZ from uploaded archives and save to BBS
REM
REM TODO: support ARC, LHZ archive files too someday

\pkware\pkunzip %1 FILE_ID.DIZ DESC.SDI
