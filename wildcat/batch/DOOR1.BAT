@ECHO OFF
REM This batch file is located in the batch directory, and is copied
REM to the node work directory and executed. It needs to change to the
REM righ location of the program being run and run the program
CD \WILDCAT
DOORTEST.EXE DOORTEST.CFG
REM The above example takes its parameters from a configuration file
REM located in the same directory. Others may take command line
REM arguments for information such as CHESS.EXE %WCPORTID% 
REM where the %WCPORTID% gets replaced by the comm port number by DOS when
REM the program is run.
