REM The batch file below runs Omen's DSZ program to invoke MobyTurbo
REM Zmodem.  It used the batch parameters %2 for com port number
REM and %5 for the name of the file containing the filenames to download
dsz port %2 ha both sz %5 -m
