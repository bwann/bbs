@Echo off

REM Generates ALLFILES.TXT and ALLFILES.ZIP using wcPro
REM Set up an event to run this every night

del \wildcat\allfiles\allfiles.zip
del \wildcat\allfiles\allfiles.txt
cd \wildcat
wcpro wcpro\allfiles

cd \wildcat\allfiles
IF EXIST allfiles.txt (
  C:\PKWARE\PKZIP allfiles.zip allfiles.txt
  cd \wildcat
  wcfile /L:allfiles.wcf
) ELSE (
  ECHO couldn't find an allfiles.txt
)

cd \wildcat
