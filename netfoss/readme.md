# C:\NETFOSS - NetFoss FOSSIL Driver

From http://pcmicro.com/netfoss

This is used in two ways at TuxedoCat Lounge, inbound modems and inbound
Telnet access

Note: I am running NetFoss v1.25. I have problems with garbage on the
serial ports running any of the 1.26 beta versions, your milage may vary.
I haven't gotten around to asking for help from the author.


1) In COM port mode: NetFoss acts as a traditional FOSSIL driver
interacting with the real modems on real serial ports through
Microsoft Windows.  Wildcat! normally only understands COM1-4 using
legacy IRQ and I/O base addresses, this lets Wildcat! utilize modems
that Windows PNP has configured at higher COM numbers, weird IRQ
numbers and I/O addresses.

This is all handled by running NETFOSS in the batch files that start
nodes 1-4 which have my modems connected to them.

2) In Telnet server mode: NET2BBS accepts inbound telnet connections,
and then spawns/forks/runs a new instance of Wildcat.exe.

### Net2bbs.ini

This is the main config file for net2bbs.  This calls NF.BAT, which then
in turn calls RUNWILD, which runs wildcat.exe.  This is similar to how
a front-end mailer might accept the call and then either run a tosser
or run the BBS node
                  
