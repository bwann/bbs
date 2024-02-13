@ECHO OFF                         

REM Wordle BBS Tournament

cd \doors\wordle
wordle.exe -Dc:\wildcat\wcwork\node%WCNODEID%\door.sys

REM Save scores as bulletin #12
copy c:\doors\wordle\bulletin.ans c:\wildcat\bull\bull12.bbs
