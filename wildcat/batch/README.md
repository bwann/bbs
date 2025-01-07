# C:\WILDCAT\BATCH - batch files

The majority of these batch scripts are called by Wildcat! to run various
door programs/games. Some are hook files that are called by Wildcat! upon
certain activities such as uploading files, in order to trigger import
of file descriptions, scan for viruses, make GIF thumbnails, etc.

### Utility scripts

These are usually called as a scheduled event on a node or all nodes.
A few noteworthy mentions:

- MAILCHK.BAT - Health check of messages and newsgroup posts via UUCP.
  This runs on every node every few hours, generating some automatic
  e-mail and newsgroup posts. This is used to check that messages are
  making it from Wildcat! to the UUCP gateway over modem and then out
  to the Internet.

- ALLFILES.BAT - every morning build a downloadable list of every file
  on the board

- PACK.BAT - Weekly run of wcPACK to purge deleted/killed messages

- MSGPURGE.BAT - Deletes old test email and newsgroup posts, registration
  nag messages

- FILEDESC.BAT - Imports FILE_ID.DIZ from .zip files upon upload. Only
  supports ZIP files, really needs to be expanded to cover ARJ, LHZ, Z,
  GZIP, XZ, etc etc etc

- IRC.BAT - Calls the MannIRC door, a Win32-based, Internet-enabled
  program to connect to Internet IRC services. This one is special because
  it uses NFU to convert normal Wildcat! DOOR.SYS drop-file to the "new"
  DOOR32.SYS style that new Win32 doors use. Most importantly it then uses
  NFU as a wrapper to call the door, and NFU has a very particular way it
  wants its current working directory and how its passed arguments.

- STATS.BAT - Calls a wcPro command file to generate the system statistics
  bulletin (WCPRO.BBS) 

- STGEN.BAT - Door program that calls STGEN-MC to pull modem diagnostics
  info from our modem and display to the caller. There's two versions,
  STGEN-MC and STGEN. STGEN-MC fetches modem stats and feeds them into
  USRSTATS which generates pretty ANSI bar charts and other reports.
  STGEN (I think) is more generic-ized and just displays raw ATI6 screens
  to the caller so it works with any modem.

    


