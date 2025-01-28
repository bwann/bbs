# www.tuxedocatbbs.com files

### Port 2323 redirector

Because the BBS and website run on different servers at different addresses,
some people may try to telnet to the wrong address. The systemd service
`tuxedocat-redirect` listens on port 2323 on the webserver and displays a
message on where to go.

```
$ telnet tuxedocatbbs.com 2323
Trying 2600:3c00:e000:2a7::231...
Connected to tuxedocatbbs.com.
Escape character is '^]'.

TuxedoCat Lounge BBS redirector
You want bbs.tuxedocatbbs.com port 2323 instead.

Connection closed by foreign host.


$ telnet -4 tuxedocatbbs.com 2323
Trying 96.126.118.181...
Connected to tuxedocatbbs.com.
Escape character is '^]'.

TuxedoCat Lounge BBS redirector
You want bbs.tuxedocatbbs.com port 2323 instead.

Connection closed by foreign host.
```
