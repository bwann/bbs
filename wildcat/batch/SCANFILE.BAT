REM The following line changes to the node work directory for the
REM node executing this batch file.
CD \WILDCAT\WCWORK\NODE%WCNODEID%
REM The next line runs the CATSCAN program (a 3rd party utility) to
REM scan the uploaded files for virii.
CATSCAN %1
REM See the CATSCAN docs for complete information. The %1 is the 
REM filename uploaded that is to be scanned.
REM No additional commands are required to return to WILDCAT! since
REM this batch assumes you are using shell rather than terminate.


