# C:\WILDCAT files

### catX.bat

These are started individually to start each node. A variety of
enviornment variables are set for Wildcat, Netfoss, and some games such
as Tradewars to handle multiplayer functions.

There's a ridiculous amount of copypasta code in here that's duplicated
between all the CATX.BAT files that could just be refactored into another
common batch file that could be called, laziness has won.

All nodes use Netfoss FOSSIL driver in COM port mode to handle talking to
the modem on the real COM port. I did this for a few reasons:

- Wildcat is a MS-DOS program and expects COM ports COM1-4 at legacy
IRQ and I/O addresses
- Windows likes to completely make up its COM port numbering, it may
decide to enumerate things as COM1, 2, 5, 7
- Due to PNP, COM ports may not be at legacy IRQ and I/O addresses

Thus Netfoss interacts with Windows and provides a standard FOSSIL interface
to Wildcat within DOS.

### runwild.bat - Netfoss entry point

When Netfoss' NET2BBS telnet server receives an inbound telnet connection,
this batch file is ultimately ran by NF.BAT. This sets the WCNODEID
based on node number given by NET2BBS, loads a Telnet modem profile,
and sets the remote IP address as the caller Id number that gets logged.

### backup.bat

Very quick and dirty way to make a backup zip file of all BBS directories


