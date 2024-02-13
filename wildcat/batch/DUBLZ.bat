@ECHO OFF                         

REM DUBLZ door

cd \doors\dublz

dublz.exe -Dc:\wildcat\wcwork\node%WCNODEID%\door.sys -n%WCNODEID%

REM Copy score files as bulletins
copy c:\doors\dublz\scores.ans c:\wildcat\bull\bull15.bbs
copy c:\doors\dublz\hof.ans c:\wildcat\bull\bull16.bbs

