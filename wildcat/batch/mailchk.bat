@Echo Off

REM Writes a timestamp to a file and mails it
REM
REM This is used as a health check, to generate some emails and test
REM usenet posts throughout the day and make sure they make it to the
REM internet via UUCP.
REM This tests Wildcat is up, modems work, UUCP gateway is up, Postfix
REM for SMTP relay is up, INND for usenet is up, and it's all making
REM it to teh Internets.
REM
REM This is executed from every node with a modem every 4 hours, with
REM staggered start times so roughly once an hour somebody is sending
REM test messages.
REM
REM This depends on two external programs:
REM - SHOWDT.EXE by Tom Rawson, which does nothing but print a timestamp
REM   because this is a surprisingly hard thing to do in a scripted
REM   fashion in MS-DOS.
REM - POSTMSTR PostMster v4.0 by Joe Lemoine. This takes a text file
REM   and inserts it into the Wildcat! message database from DOS.
REM   It has the side effect of sending a nag message once a day telling
REM   you to register it, unfortunately I don't think he's around anymore.
REM
REM   TODO: set up a wcPro rule to delete the nag messages

REM *** Test e-mail

IF EXIST C:\temp\mailchk.txt DEL c:\temp\mailchk.txt
ECHO IAMOK > c:\temp\mailchk.txt
C:\WILDCAT\UTILS\SHOWDT\SHOWDT.EXE >> c:\temp\mailchk.txt
ECHO @BBS@ node# %WCNODEID% >> c:\temp\mailchk.txt

CD\WILDCAT
postmstr /I:c:\temp\mailchk.txt /C:100 /T:bwann@wann.net /S:Cron Wildcat! email /P


REM *** Test newgroup post with a random 2 kilobyte text payload just
REM to give the modems something that will take several seconds to transfer
REM to test stability

ECHO . >> c:\temp\mailchk.txt
ECHO 2 KB test >> c:\temp\mailchk.txt
ECHO . >> c:\temp\mailchk.txt
TYPE c:\wildcat\utils\rand2k.txt >> c:\temp\mailchk.txt

postmstr /I:c:\temp\mailchk.txt /C:101 /T:ALL /S:Automated test post


REM TODO: set up a wcPro message action to delete the registration nag
REM messages from Postmstr
