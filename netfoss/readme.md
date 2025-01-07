# C:\NETFOSS - NetFoss FOSSIL Driver

NetFoss website: http://pcmicro.com/netfoss

Also available on archive.org: https://web.archive.org/web/20240814075945/https://pcmicro.com/netfoss/

NetFoss is used in two ways at TuxedoCat Lounge, inbound modems and inbound
Telnet access

Wildcat! 4 is a MS-DOS only application with no TCP/IP stack. I'm running it on
Windows 7 (32-bit), with each node in its own "Command Prompt"[^1] window. With NetFoss, this lets
me run a Telnet server (net2bbs) as a Windows service and connect telnet users to the BBS.
It also lets me run normal Wildcat! nodes to accept calls from plain dial-up modems.

These two modes or functions are independent of each other. If you only want to use NetFoss as
a FOSSIL driver, there's no need to set up NET2BBS. Likewise if you only want to
support inbound telnet visitors, there's no need to load/unload NETFOSS.EXE before
and after starting Wildcat!

Version note: I am running NetFoss v1.25. I have problems with garbage on the
serial ports running any of the 1.26 beta versions, your milage may vary.
I haven't gotten around to asking for help from the author.

For more information on how NetFoss can be used, refer to the NetFoss user guide on
their website. Comb through all of the examples, even those not related to Wildcat!
for ideas on how the software is used.

### COM port mode for inbound modem callers
In COM port mode: NetFoss acts as a traditional FOSSIL driver
interacting with the real modems on real serial ports through
Microsoft Windows.  Wildcat! normally only understands COM1-4 using
legacy IRQ and I/O base addresses, this lets Wildcat! utilize modems
that Windows PNP has configured at higher COM numbers, weird IRQ
numbers and I/O addresses.

This is all handled by running NETFOSS in the batch files (CATX.BAT) that start
nodes 1-4 which have my modems connected to them. See examples in the /wildcat/batch
directory.

Fun fact, when used with a FOSSIL driver Wildcat! doesn't even care or know what COM port
it's talking to. The FOSSIL driver instance could be using COM7 on the real system, the
Wildcat! node could be configured with a MDM profile to use the FOSSIL driver and
COM2 and it just works.

tl;dr: start NETFOSS.EXE with a node number and real COM port, run WILDCAT.EXE, then
NETFOSS.EXE /U to unload the driver

### NET2BBS for inbound telnet

In Telnet server mode: NET2BBS accepts inbound telnet connections,
and then spawns/forks/runs a new instance of Wildcat.exe. When the Telnet user
exits or disappears, the instance of Wildcat! exits and goes away.

### Net2bbs.ini

This is the main config file for NET2BBS telnet server. NET2BBS calls NF.BAT,
which then in turn calls C:\WILDCAT\RUNWILD.BAT, which starts a new WILDCAT.EXE. This is
similar to how a front-end mailer might accept the call and then either run a tosser
or run the BBS node

### NF.BAT

This file is originally provided by NetFoss. It's ran each time a new incoming telnet
user comes in, as specified by the `Command=` directive in net2bbs.ini.
This is only slightly modified to slow down output so telnet 'feel' is closer to that
of a modem.
                  

[^1]: Tip: "Command Prompt" in Windows since NT/2000/XP is not really MS-DOS. It is an instance of
the NT Virtual DOS Machine (NTVDM) that is built into Windows and emulates nearly all DOS APIs.
As far as running programs are concerned, it thinks it's running on MS-DOS.
Up until Windows 10 or so it also supported running 16-bit MS-DOS applications, which we
have here. Think of NetFoss as replacing some of these DOS API calls. When Wildcat makes a
INT 14h call to talk to a modem, NetFoss handles that request.
