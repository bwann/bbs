![wc4ansi](https://github.com/user-attachments/assets/02649d83-07c7-4313-86bb-d32d07e5fd09)

# C:\WILDCAT files

### catX.bat

These are started individually to start each node. A variety of
environment variables are set for Wildcat, Netfoss, and some games such
as Tradewars to handle multiplayer functions.

I just start these up on with shortcuts in the Startup program group.

- Nodes 1, 2, 3 - real modems to handle dial-up callers
- Node 4 - direct serial connection to a Cisco router acting as a X.25 PAD
  for visitors from Telebahn X.25 network
- Node 5-9 - inbound telnet connections
- Node 250 - local sysop node
- Node 0 doesn't work here since we're not actually running SHARE.EXE nor NetWare

Some common commands for all dial-up nodes has been refactored into CMNCAT.BAT so
the per-node catX files are as small as possible.

All modem nodes use Netfoss FOSSIL driver in COM port mode to handle talking to
the modem on the real COM port. I did this for a few reasons:

- Wildcat is a MS-DOS program and expects COM ports COM1-4 at legacy ISA
  IRQ and I/O addresses
- Windows likes to completely make up its COM port numbering, it may
  decide to enumerate things as COM1, 2, 5, 7[^1]
- Due to Plug-n-Play, COM ports may not be at legacy IRQ and I/O addresses

Thus Netfoss interacts with Windows and provides a standard FOSSIL interface
to Wildcat within DOS.

When it comes time to do testing, I'll either use wcModem which
understands FOSSIL, or Qmodem with a COM port that's still on the old ISA
IRQ and I/O values.

### runwild.bat - Netfoss entry point for telnet nodes

When Netfoss' NET2BBS telnet server receives an inbound telnet connection,
the C:\WILDCAT\RUNWILD.BAT batch file is ultimately ran by NF.BAT. This
keeps all of our custom variables and commands out of the NF.BAT batch
file so it stays as stock as possible, and keeps all of the WC node start
files in the same place. 

RUNWILD sets the WCNODEID variable based on node number passed as an argument
by NET2BBS, loads a Telnet modem profile, and sets the remote IP address as
the caller Id number that gets logged. It also avoids the running of NETFOSS.EXE
that happens in other CATX.BAT files.

NET2BBS -> NF.BAT -> RUNWILD.BAT -> WILDCAT.EXE

### backup.bat

Very quick and dirty way to make a backup zip file of all BBS directories


### batch/

Some batch files from C:\WILDCAT\BATCH. Mostly for loading doors,
some Wildcat! hook scripts, some utility batch files.

### gateway/

Files for configuring UUCP mail/newsgroup transfers using FX UUCICO,
wcGate

### modem/

Some modem profile files used by the BBS, created/edited with wcMODEM

### wcpro/

Some report and command macros for cleaning up the message database,
processing reports.

[^1]: You can re-number your COM ports in Windows, I did it following https://blogs.gwu.edu/ecelabs/2020/06/25/resetting-windows-com-ports/
