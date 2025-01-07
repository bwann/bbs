@echo off

REM Clean up message database
REM Run as a node event every morning

REM Purge all messages greater than 3 days old from tuxedocat.test usenet
REM group (conf id 101)

wcpack /d:7 /i 101
