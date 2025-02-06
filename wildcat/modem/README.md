# C:\WILDCAT\MODEM files - wcModem modem profiles

Modem profiles used by TuxedoCat Lounge

### usrdsf.mdm

US Robotics Courier V.34 with FOSSIL driver. Enables caller-id on the modem and logs caller-id number.
+++ attention string enabled so the USRStats door can query modem.
Based on the original USR Courier Dual-standard .mdm file, with fixes.

### telnet.mdm

Profile used for incoming telnet connections with a FOSSIL driver. Locked DTE speed at 115.2k, with
8-bit telnet mode enabled. Force error correction mode should be on so protocols such as YMODEM-G
are enabled, but it doesn't work for some reason.

### x25ring.mdm

A very special direct, null-modem serial connection to a Cisco router serving as an X.25 PAD for
incoming X.29 sessions. This requires a RS-232 cable with real DCD support, and ring detect is
determined in-band with the Cisco emitting a 'RINGRING' string on new inbound sessions.
Based on the X.25 PAD configuration from the WC Sysop guide. 

This is the .MDM file used with the X.25 -> Cisco Aux -> BBS serial port setup as documented in
https://binaryfury.wann.net/2024/08/connecting-a-bbs-to-a-cisco-aux-port-gracefully/
