# C:\NETFOSS - NetFoss FOSSIL Driver

NetFoss website http://pcmicro.com/netfoss
Also available on archive.org: https://web.archive.org/web/20240814075945/https://pcmicro.com/netfoss/

NetFoss is used in two ways at TuxedoCat Lounge, inbound modems and inbound
Telnet access

Wildcat! 4 is a MS-DOS only application with no TCP/IP stack. I'm running it on 32-bit
Windows 7, with each node in its own "Command Prompt" window. With NetFoss, this lets
me run a Telnet server (net2bbs) as a Windows service and connect telnet users to the BBS.
It also lets me run normal Wildcat! nodes to accept calls from plain dial-up modems.

Version note: I am running NetFoss v1.25. I have problems with garbage on the
serial ports running any of the 1.26 beta versions, your milage may vary.
I haven't gotten around to asking for help from the author.

These two modes are independent of each other. If you only want to use NetFoss as
a FOSSIL driver, there's no need to set up NET2BBS. Likewise if you only want to
support inbound telnet visitors, there's no need to load/unload NETFOSS.EXE before
and after starting Wildcat!

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

This is all handled by running NETFOSS in the batch files that start
nodes 1-4 which have my modems connected to them.

tl;dr: start NETFOSS.EXE with a node number and real COM port, run WILDCAT.EXE, then
NETFOSS.EXE /U to unload the driver

### NET2BBS for inbound telnet

In Telnet server mode: NET2BBS accepts inbound telnet connections,
and then spawns/forks/runs a new instance of Wildcat.exe. When the Telnet user
exits or disappears, the instance of Wildcat! exits and goes away.

### Net2bbs.ini

This is the main config file for net2bbs.  This calls NF.BAT, which then
in turn calls RUNWILD, which runs wildcat.exe.  This is similar to how
a front-end mailer might accept the call and then either run a tosser
or run the BBS node
                  
