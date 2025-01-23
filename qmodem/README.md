# Qmodem modem testing script

For BBS call completion testing when evaluating modems and analog telephone adapters, I use MS-DOS based Qmodem on bare metal 486. For a few reasons:
Part nostaliga, this is what I used to use and it's effective. I don't want the overhead of DOSBOX or Windows 95 influencing results.  There
isn't a Linux communications program that comes anywhere close to providing call scripting that handles a full call, downloads, and error
conditions. I don't want to go write a whole Python or expect thing that interacts directly with a serial line to do the same thing.
(The latter would be considerably useful for remote locations that don't have a DOS system)

For my testing, merely establishing a modem connection is not good enough. An important part of the BBS experience
is being able to transfer files, so this script simulates a caller downloading a 64 kilobyte text file from a BBS, typically using Ymodem.

I have used both Qmodem 4.5 Test Drive and Qmodem 5.0 for testing. Scripting help can be found in QMODEM.DOC included with the
program or at https://archive.org/details/qmodem-v-4.5-1992

### loop.bat

This batch file does nothing but call QMODEM.EXE passing /S to load a QuickScript, pause for a few seconds,
then call itself so it runs in a loop over and over forever.

### dl.scr

The script that simulates a BBS caller. It dials an entry in the Dial Directory, logs in to the BBS, navigates to the file area
and downloads a specified filename using a specified protocol, then says goodbye. A capture file is used to record the entire call
session with specific log lines and timestamps added such as `#### start_qmodem <time>` or `#### start_download <time>`.

Upon any errors, unexpected characters, lost carrier, the script aborts and exits Qmodem. This is because the call will be considered
as a failure and there's no need to attempt to recover during the call.

The capture file is later parsed with a Python script to derive timing information from the added timestamps such as time to
connect, connection bits per second, time to download, download character per second rate, total call duration, and modem diagnostic
data.

Normally between runs only the `Capture` statement is updated to change the directory being written to, to reflect today's date. This
helps ensure the consistency of tests between modems and calls. The script is the result of thousands of calls, so it's pretty okay.


The post-processing Python script is still a raw, work in progress and thus I haven't published it.
