@echo off

REM Weekly wcPACK task to purge deleted messages from
REM all conferences. Wednesdays sound good.
REM
REM Results logged to C:\WILDCAT\WCPACK.LOG
REM
REM Notes:
REM - wcPACK can't pack conference #0 until all nodes are down
REM - wcPACK also can't renumber messages until all nodes are
REM   down because it needs exclusive access to the message and
REM   user database to update pointers. Renumbering shouldn't be
REM   needed until 65k messages have been posted to a conference.
REM - wcpackx uses XMS memory

cd \wildcat
wcpackx /i /a
