@ECHO OFF

REM DOSRBC: Cleanup script
REM Last modified on 25 September 2023

REM This script takes care of traces left behind by the games listed in the
REM SUPPORT file

REM Declare the path to your game directory here
SET DOSGRDIR=C:\GAMES

ECHO DOSRBC: Cleanup script running
ECHO.

IF "%DOSGRDIR%" == "" ECHO Please specify your game root directory
IF "%DOSGRDIR%" == "" PAUSE
IF "%DOSGRDIR%" == "" EXIT

IF NOT "%DOSGRDIR%" == "" ECHO Game root directory found. Continuing...
IF NOT "%DOSGRDIR%" == "" ECHO.

REM BOOM

SET BOOMDIR=%DOSGRDIR%\BOOM

REM Delete configuration files
DEL "%BOOMDIR%\*.CFG"

REM Delete savegames
DEL "%BOOMDIR%\BOOMSAV*.DSG"

REM Delete PCX format screenshots
DEL "%BOOMDIR%\DOOM*.PCX"

REM Crawl

SET CRAWLDIR=%DOSGRDIR%\LINCRAWL

REM Delete bones files
DEL "%CRAWLDIR%\BONES.0*A"

REM Delete 00A savegame data
DEL "%CRAWLDIR%\*.00A"

REM Delete savegames
DEL "%CRAWLDIR%\*.SAV"

REM Delete character files
REM
REM Commented out, because this would delete all text files in the LINCRAWL
REM directory.
REM DEL "%CRAWLDIR%\*.TXT"

REM Delete morgue file
DEL "%CRAWLDIR%\MORGUE.TXT"

REM Delete highscores
DEL "%CRAWLDIR%\SCORES"

REM DOOM

SET DOOMDIR=%DOSGRDIR%\DOOM

REM Delete configuration
DEL "%DOOMDIR%\*.CFG"

REM Delete temporary DM file
DEL "%DOOMDIR%\*.TMP"

REM Delete savegames
DEL "%DOOMDIR%\DOOMSAV*.DSG"

REM DOOM II

SET DOOM2DIR=%DOSGRDIR%\DOOM2

REM Delete configuration
DEL "%DOOM2DIR%\*.CFG"

REM Delete temporary DM file
DEL "%DOOM2DIR%\*.TMP"

REM Delete savegames
DEL "%DOOM2DIR%\DOOMSAV*.DSG"

REM Delete modem numbers file
DEL "%DOOM2DIR%\*.NUM"

REM EW Snake

SET EWSNKDIR=%DOSGRDIR%\EWSNAKE

REM Delete 05 file
DEL "%EWSNKDIR%\*.05"

REM Freedoom

SET FDOOMDIR=%DOSGRDIR%\FREEDOOM

REM Delete BMP format screenshots
DEL "%FDOOMDIR%\DOOM*.BMP"

REM Delete PCX format screenshots
DEL "%FDOOMDIR%\DOOM*.PCX"

REM Delete SMMU configuration
DEL "%FDOOMDIR%\*.CFG"

REM Delete SMMU savegames
DEL "%FDOOMDIR%\SMMUSAV*.DSG"

REM Delete transitional map file
DEL "%FDOOMDIR%\*.DAT"

REM Hangman

SET HANGMAND=%DOSGRDIR%\HANGMAN

REM Delete configuration
DEL "%HANGMAND%\*.CFG"

REM Heretic

SET HERETICD=%DOSGRDIR%\HERETIC

REM Delete temporary DM file
DEL "%HERETICD%\*.TMP"

REM Delete configuration
DEL "%HERETICD%\*.CFG"

REM Delete savegames
DEL "%HERETICD%\HTICSAV*.HSG"

REM Delete modem numbers file
DEL "%HERETICD%\*.NUM"

REM Jill of the Jungle

SET JOTJDIR=%DOSGRDIR%\JILL

REM Delete configuration
DEL "%JOTJDIR%\JILL*.CFG"

REM Delete savegame files
DEL "%JOTJDIR%\JN*SAVE*.*"

REM Delete temporary file
DEL "%JOTJDIR%\TEMP"

REM Kiloblaster

SET KILOBDIR=%DOSGRDIR%\KILOBLAS

REM Delete configuration
DEL "%KILOBDIR%\CONFIG.KB*"

REM Delete savegames
DEL "%KILOBDIR%\KB*_SAVE.*"

REM Delete KFILEB.BAT
DEL "%KILOBDIR%\KFILEB.BAT"

REM Leisure Suit Larry 5

SET LSL5DIR=%DOSGRDIR%\LARRY5

REM Delete savegames
DEL "%LSL5DIR%\LSL5SG.0*"

REM Delete savegame directory file
DEL "%LSL5DIR%\*.DIR"

REM Delete configuration
DEL "%LSL5DIR%\RESOURCE.CFG"

REM Liquid War

SET LWDIR=%DOSGRDIR%\LIQUIWAR

REM Delete configuration
DEL "%LWDIR%\*.CFG"

REM Delete log file
DEL "%LWDIR%\*.LOG"

REM Nethack

SET NETHACKD=%DOSGRDIR%\NETHACK

REM Delete bones files
DEL "%NETHACKD%\BON*0.*"

REM Delete character savegames
DEL "%NETHACKD%\*.0"
DEL "%NETHACKD%\*.1"
DEL "%NETHACKD%\*.SAV"

REM Delete log file
DEL "%NETHACKD%\LOGFILE"

REM Delete records
DEL "%NETHACKD%\RECORD"

REM Paku Paku

SET PAKUDIR=%DOSGRDIR%\PAKUPAKU

REM Delete highscores
DEL "%PAKUDIR%\*.DAT"

REM Quake

SET QUAKEDIR=%DOSGRDIR%\QUAKE

REM Delete configuration files
DEL "%QUAKEDIR%\ID1\*.CFG"

REM Delete PCX format screenshots
DEL "%QUAKEDIR%\ID1\QUAKE*.PCX"

REM Delete quicksave
DEL "%QUAKEDIR%\ID1\QUICK.SAV"

REM Delete savegames
DEL "%QUAKEDIR%\ID1\S*.SAV"

REM SECRET AGENT

SET SECAGNTD=%DOSGRDIR%\SAM

REM Delete configuration and highscores
DEL "%SECAGNTD%\SAM*.CFG"

REM Delete savegames
DEL "%SECAGNTD%\SAM*-*.SAV"

REM Shadow Warrior

SET SWDIR=%DOSGRDIR%\SW

REM Delete configuration
DEL "%SWDIR%\*.CFG"

REM Delete savegames
DEL "%SWDIR%\GAME*.SAV"

REM Delete PCX format screenshots
DEL "%SWDIR%\SWCP*.PCX"

REM TEENAGENT

SET TAGNTDIR=%DOSGRDIR%\TEENAGNT

REM Delete sound configuration
DEL "%TAGNTDIR%\*.SET"

REM Delete savegames
DEL "%TAGNTDIR%\TEENAGE*.SAV"

REM TETRIS Queen

SET QTETRISD=%DOSGRDIR%\QTETRIS

REM Delete configuration
DEL "%QTETRISD%\*.CFG"

REM Delete "Hall of Fame"
DEL "%QTETRISD%\*.HOF"

REM Tyrian 2000

SET T2KDIR=%DOSGRDIR%\TYRIAN2K

REM Delete NEWSH_~6.SHP
DEL "%T2KDIR%\NEWSH_~6.SHP"

REM Delete SETUP.BOX
DEL "%T2KDIR%\SETUP.BOX"

REM Delete log file
DEL "%T2KDIR%\*.LOG"

REM Delete configuration
DEL "%T2KDIR%\*.CFG"

REM Delete HDT file
DEL "%T2KDIR%\*.HDT"

REM Delete savegame file
DEL "%T2KDIR%\*.SAV"

REM Vertigo

SET VERTIGOD=%DOSGRDIR%\VERTIGO

REM Delete sound configuration
DEL "%VERTIGOD%\*.CFG"

REM Delete VER_CFG.GCC
DEL "%VERTIGOD%\*.GCC"

REM WING (WING Is Not Galaga)

SET WINGDIR=%DOSGRDIR%\WING

REM Delete highscores
DEL "%WINGDIR%\*.DAT"

REM Wolfenstein 3-D

SET WOLF3DRD=%DOSGRDIR%\WOLF3D

REM Delete configuration and highscores
DEL "%WOLF3DRD%\CONFIG.WL6"

REM Delete savegames
DEL "%WOLF3DRD%\SAVEGAM*.WL6"

REM Delete/unset variables
SET BOOMDIR=
SET CRAWLDIR=
SET DOOMDIR=
SET DOOM2DIR=
SET EWSNKDIR=
SET FDOOMDIR=
SET HANGMAND=
SET HERETICD=
SET JOTJDIR=
SET KILOBDIR=
SET LSL5DIR=
SET LWDIR=
SET NETHACKD=
SET PAKUDIR=
SET QUAKEDIR=
SET SECAGNTD=
SET SWDIR=
SET TAGNTDIR=
SET QTETRISD=
SET T2KDIR=
SET VERTIGOD=
SET WINGDIR=
SET WOLF3DRD=

ECHO DOSRBC: Cleanup script is done.
ECHO.
