@echo off

REM Clean up message database
REM Run as a node event every morning

REM Purge all messages greater than 3 days old from tuxedocat.test usenet
REM group (conf id 101)

wcpack /d:7 /i 101

REM Purge all old test healthcheck e-mails in Internet e-mail conf (100)
REM older than 7 days
REM Uses a wcPRO message match filter and command file named CRONDEL.PMM

cd \wildcat
wcpro wcpro\crondel.pro

REM Purge all old Postmaster registration nag messages since we can't
REM register it

cd \wildcat
wcpro wcpro\reg.pro
