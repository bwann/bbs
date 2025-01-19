@Echo off

REM Generates ALLFILES.TXT and ALLFILES.ZIP using wcPro
REM Then use wcFILE to upload the new list to file area 1 using
REM a .WCF command file. The command file also tells wcFILE to
REM not update the file date/time so it doesn't show up every
REM time somebody does a new file check.
REM
REM Set up an event to run this every night

REM C:\wildcat\allfiles is a temporary work directory

IF NOT EXIST \wildcat\allfiles MKDIR \wildcat\allfiles

del \wildcat\allfiles\allfiles.zip
del \wildcat\allfiles\allfiles.txt

REM wcPRO .PFM contains a filter to match the new files,
REM and the .PRO contains the output path

cd \wildcat
wcpro wcpro\allfiles.pro

cd \wildcat\allfiles
IF NOT EXIST allfiles.txt GOTO :NOFILE

C:\PKWARE\PKZIP allfiles.zip allfiles.txt
cd \wildcat

REM run wcFile with a command file to tell it how to upload
REM the new allfiles lists to file areas.
wcfile /L:allfiles.wcf

GOTO :END

:NOFILE
ECHO couldn't find an allfiles.txt to process
EXIT /B 1

:END
