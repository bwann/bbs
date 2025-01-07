@Echo off

REM Generates ALLFILES.TXT and ALLFILES.ZIP using wcPro
REM Then use wcFILE to upload the new list to file area 1 using
REM a .WCF command file. The command file also tells wcFILE to
REM not update the file date/time so it doesn't show up every
REM time somebody does a new file check.
REM
REM Set up an event to run this every night

REM C:\wildcat\allfiles is a temporary work directory

del \wildcat\allfiles\allfiles.zip
del \wildcat\allfiles\allfiles.txt
cd \wildcat
wcpro wcpro\allfiles

cd \wildcat\allfiles
IF EXIST allfiles.txt (
  C:\PKWARE\PKZIP allfiles.zip allfiles.txt
  cd \wildcat

  REM run wcFile with a command file to tell it how to upload
  REM the new allfiles lists to file areas.
  wcfile /L:allfiles.wcf

) ELSE (
  ECHO couldn't find an allfiles.txt
)

cd \wildcat
