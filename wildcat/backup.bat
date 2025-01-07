REM Manually set a timestamp here to use in filenames because Windows
REM and PowerShell make it too damn hard to just do this for us.

SET TS=20241015
rem echo %TS%


"c:\program files\7-zip\7z.exe" a -tzip "C:\backup\wildcat-%TS%.zip" "c:\wildcat"
"c:\program files\7-zip\7z.exe" a -tzip "C:\backup\doors-%TS%.zip" "c:\doors"
"c:\program files\7-zip\7z.exe" a -tzip "C:\backup\netfoss-%TS%.zip" "c:\netfoss"
