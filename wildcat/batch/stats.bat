@Echo off

REM Generates system statistics (WCPRO.BBS) using wcPro that's
REM visible to the callers from the main menu.

REM Must start from \wildcat
cd \wildcat
wcpro wcpro\stats.pro
