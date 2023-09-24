@ECHO OFF

REM DOSRBC: Gamestate backup script
REM Last modified on 24 September 2023

REM This script should backup profiles, settings, savegames, highscores etc.,
REM which are herein collectively referred to as gamestate.

REM Declare the path to your root game directory here
REM
REM The abbreviation DOSGRDIR means DOS game root directory which is mostly done
REM because of the eight character limit in relation to file and folder names on
REM DOS systems.
SET DOSGRDIR=C:\GAMES

ECHO DOSRBC: Gamestate backup script running
ECHO.

IF "%DOSGRDIR%" == "" ECHO Please specify your game root directory
IF "%DOSGRDIR%" == "" PAUSE
IF "%DOSGRDIR%" == "" EXIT

REM ELSE keyword workaround for DOS
IF NOT "%DOSGRDIR%" == "" ECHO Game root directory found. Continuing...
IF NOT "%DOSGRDIR%" == "" ECHO.

REM This particular section can probably be implemented via GOTO routines. The
REM exit command at the end of each GOTO section seems to fail, so I decided
REM to comment out the following.

REM IF "%DOSGRDIR%" == "" GOTO GRDTRUE
REM IF NOT "%DOSGRDIR%" == "" GOTO GRDFALSE

REM :GRDTRUE
REM ECHO Please specify your game root directory
REM PAUSE
REM EXIT

REM :GRDFALSE
REM ECHO Game root directory found. Continuing...
REM ECHO.
REM EXIT

REM BOOM

SET BOOMDIR=%DOSGRDIR%\BOOM

REM Backup Allegro and BOOM configuration
IF EXIST %BOOMDIR%\*.CFG ECHO BOOM: Backing up configuration files
IF EXIST %BOOMDIR%\*.CFG XCOPY /I /Y "%BOOMDIR%\*.CFG" "BOOM\CONFIG"
IF EXIST %BOOMDIR%\*.CFG ECHO.

IF NOT  EXIST %BOOMDIR%\*.CFG ECHO BOOM: Configuration files not found. Skipping...
IF NOT EXIST %BOOMDIR%\*.CFG ECHO.

REM Backup savegames
IF EXIST %BOOMDIR%\BOOMSAV*.DSG ECHO BOOM: Backing up savegames
IF EXIST %BOOMDIR%\BOOMSAV*.DSG XCOPY /I /Y "%BOOMDIR%\BOOMSAV*.DSG" "BOOM\SAVEGAME"
IF EXIST %BOOMDIR%\BOOMSAV*.DSG ECHO.

IF NOT EXIST %BOOMDIR%\BOOMSAV*.DSG ECHO BOOM: Savegames not found. Skipping...
IF NOT EXIST %BOOMDIR%\BOOMSAV*.DSG ECHO.

REM Backup PCX format screenshots
IF EXIST %BOOMDIR%\*.PCX  ECHO BOOM: Backing up PCX screenshots
IF EXIST %BOOMDIR%\*.PCX XCOPY /I /Y "%BOOMDIR%\*.PCX" "BOOM\SCRSHOT"
IF EXIST %BOOMDIR%\*.PCX ECHO.

IF NOT EXIST %BOOMDIR%\*.PCX ECHO BOOM: PCX screenshots not found. Skipping...
IF NOT EXIST %BOOMDIR%\*.PCX ECHO.

ECHO BOOM: Done.
ECHO.

REM Crawl

SET CRAWLDIR=%DOSGRDIR%\LINCRAWL

REM Backup bones files
IF EXIST %CRAWLDIR%\BONES.0*A ECHO Crawl: Backing up bones files
IF EXIST %CRAWLDIR%\BONES.0*A XCOPY /I /Y "%CRAWLDIR%\BONES.0*A" "CRAWL\BONES"
IF EXIST %CRAWLDIR%\BONES.0*A ECHO.

IF NOT EXIST %CRAWLDIR%\BONES.0*A ECHO Crawl: Bones files not found. Skipping...
IF NOT EXIST %CRAWLDIR%\BONES.0*A ECHO.

REM Backup 00A files
REM
REM 00A files usually are created when saving a game and are named after the
REM in-game character. That filename is the same as its .SAV counterpart. So,
REM it should look like this:
REM
REM C:\GAMES\LINCRAWL
REM  - {CHAR}.00A
REM  - {CHAR}.SAV
IF EXIST %CRAWLDIR%\*.00A ECHO Crawl: Backing up 00A savegame data
IF EXIST %CRAWLDIR%\*.00A XCOPY /I /Y "%CRAWLDIR%\*.00A" "CRAWL\SAVEGAME"
IF EXIST %CRAWLDIR%\*.00A ECHO.

IF NOT EXIST %CRAWLDIR%\*.00A ECHO Crawl: 00A files not found. Skipping...
IF NOT EXIST %CRAWLDIR%\*.00A ECHO.

REM Backup savegames
IF EXIST %CRAWLDIR%\*.SAV ECHO Crawl: Backing up savegames
IF EXIST %CRAWLDIR%\*.SAV XCOPY /I /Y "%CRAWLDIR%\*.SAV" "CRAWL\SAVEGAME"
IF EXIST %CRAWLDIR%\*.SAV ECHO.

IF NOT EXIST %CRAWLDIR%\*.SAV ECHO Crawl: Savegames not found. Skipping...
IF NOT EXIST %CRAWLDIR%\*.SAV ECHO.

REM Backup character files
REM
REM Unfortunately, this one is too complicated for me to figure out. Basically,
REM by pressing the "#" key in default configuration, your character information
REM will be written in plaintext format into a text file as in:
REM C:\GAMES\LINCRAWL\{CHARNAME}.TXT
REM
REM Copying this file via XCOPY in DOS seems difficult, because DOS XCOPY
REM doesn't seem to have an /EXCLUDE argument/option/parameter. The way you
REM would do this on a Windows system would be to first create an exclude file
REM like CRAWLEXC.TXT.
REM
REM CRAWLEXC.TXT:
REM CRAWL.TXT
REM INIT.TXT
REM LICENCE.TXT
REM MACRO.TXT
REM MORGUE.TXT
REM PACKAGED.TXT
REM README.TXT

REM Finally, in the actual batch file you would do this:
REM
REM if exist "%crawldir%\*.txt" (
REM 	echo Crawl: Backing up character files
REM 	xcopy /exclude:CRAWLEXC.TXT /i /y "%crawldir%\*.txt" "CRAWL\CHARINFO"
REM 	echo.
REM ) else (
REM 	echo Crawl: Character files not found. Skipping...
REM 	echo.
REM )

REM If the DOS version of XCOPY would have the exclusion functionality
REM implemented, I assume one possible batch file solution could be:
REM
REM IF EXIST %CRAWLDIR%\*.TXT ECHO Crawl: Backing up character files
REM IF EXIST %CRAWLDIR%\*.TXT XCOPY /EXCLUDE:CRAWLEXC.TXT /I /Y "%CRAWLDIR%\*.TXT" "CRAWL\CHARINFO"
REM IF EXIST %CRAWLDIR%\*.TXT ECHO.
REM
REM IF NOT EXIST %CRAWLDIR%\*.TXT ECHO Crawl: Character files not found. Skipping...
REM IF NOT EXIST %CRAWLDIR%\*.TXT ECHO.

REM Backup morgue file
IF EXIST %CRAWLDIR%\MORGUE.TXT ECHO Crawl: Backing up morgue file
IF EXIST %CRAWLDIR%\MORGUE.TXT XCOPY /I /Y "%CRAWLDIR%\MORGUE.TXT" "CRAWL"
IF EXIST %CRAWLDIR%\MORGUE.TXT ECHO.

IF NOT EXIST %CRAWLDIR%\MORGUE.TXT ECHO Crawl: Morgue file not found. Skipping...
IF NOT EXIST %CRAWLDIR%\MORGUE.TXT ECHO.

REM Backup scores file
IF EXIST %CRAWLDIR%\SCORES ECHO Crawl: Backing up scores file
IF EXIST %CRAWLDIR%\SCORES XCOPY /I /Y "%CRAWLDIR%\SCORES" "CRAWL"
IF EXIST %CRAWLDIR%\SCORES ECHO.

IF NOT EXIST %CRAWLDIR%\SCORES ECHO Crawl: Scores file not found. Skipping...
IF NOT EXIST %CRAWLDIR%\SCORES ECHO.

ECHO Crawl: Done.
ECHO.

REM DOOM

SET DOOMDIR=%DOSGRDIR%\DOOM

REM Backup configuration files for DM and DOOM
IF EXIST %DOOMDIR%\*.CFG ECHO DOOM: Backing up configuration files
IF EXIST %DOOMDIR%\*.CFG XCOPY /I /Y "%DOOMDIR%\*.CFG" "DOOM\CONFIG"
IF EXIST %DOOMDIR%\*.CFG ECHO.

IF NOT EXIST %DOOMDIR%\*.CFG ECHO DOOM: Configuration files not found. Skipping...
IF NOT EXIST %DOOMDIR%\*.CFG ECHO.

REM Backup temporary DM file
IF EXIST %DOOMDIR%\*.TMP ECHO DOOM: Backing up temporary DM file
IF EXIST %DOOMDIR%\*.TMP XCOPY /I /Y "%DOOMDIR%\*.TMP" "DOOM"
IF EXIST %DOOMDIR%\*.TMP ECHO.

IF NOT EXIST %DOOMDIR%\*.TMP ECHO DOOM: Temporary DM file not found. Skipping...
IF NOT EXIST %DOOMDIR%\*.TMP ECHO.

REM Backup savegames
IF EXIST %DOOMDIR%\DOOMSAV*.DSG ECHO DOOM: Backing up savegames
IF EXIST %DOOMDIR%\DOOMSAV*.DSG XCOPY /I /Y "%DOOMDIR%\DOOMSAV*.DSG" "DOOM\SAVEGAME"
IF EXIST %DOOMDIR%\DOOMSAV*.DSG ECHO.

IF NOT EXIST %DOOMDIR%\DOOMSAV*.DSG ECHO DOOM: Savegames not found. Skipping...
IF NOT EXIST %DOOMDIR%\DOOMSAV*.DSG ECHO.

ECHO DOOM: Done.
ECHO.

REM DOOM II

SET DOOM2DIR=%DOSGRDIR%\DOOM2

REM Backup configuration files
IF EXIST %DOOM2DIR%\*.CFG ECHO DOOM II: Backing up configuration files
IF EXIST %DOOM2DIR%\*.CFG XCOPY /I /Y "%DOOM2DIR%\*.CFG" "DOOM2\CONFIG"
IF EXIST %DOOM2DIR%\*.CFG ECHO.

IF NOT EXIST %DOOM2DIR%\*.CFG ECHO DOOM II: Configuration files not found. Skipping...
IF NOT EXIST %DOOM2DIR%\*.CFG ECHO.

REM Backup temporary DM file
IF EXIST %DOOM2DIR%\*.TMP ECHO DOOM II: Backing up temporary DM file
IF EXIST %DOOM2DIR%\*.TMP XCOPY /I /Y "%DOOM2DIR%\*.TMP" "DOOM2"
IF EXIST %DOOM2DIR%\*.TMP ECHO.

IF NOT EXIST %DOOM2DIR%\*.TMP ECHO DOOM II: Temporary DM file not found. Skipping...
IF NOT EXIST %DOOM2DIR%\*.TMP ECHO.

REM Backup savegames
IF EXIST %DOOM2DIR%\DOOMSAV*.DSG ECHO DOOM II: Backing up savegames
IF EXIST %DOOM2DIR%\DOOMSAV*.DSG XCOPY /I /Y "%DOOM2DIR%\DOOMSAV*.DSG" "DOOM2\SAVEGAME"
IF EXIST %DOOM2DIR%\DOOMSAV*.DSG ECHO.

IF NOT EXIST %DOOM2DIR%\DOOMSAV*.DSG ECHO DOOM II: Savegames not found. Skipping...
IF NOT EXIST %DOOM2DIR%\DOOMSAV*.DSG ECHO.

REM Backup modem numbers file
IF EXIST %DOOM2DIR%\*.NUM ECHO DOOM II: Backing up modem numbers file
IF EXIST %DOOM2DIR%\*.NUM XCOPY /I /Y "%DOOM2DIR%\*.NUM" "DOOM2"
IF EXIST %DOOM2DIR%\*.NUM ECHO.

IF NOT EXIST %DOOM2DIR%\*.NUM ECHO DOOM II: Modem numbers file not found. Skipping...
IF NOT EXIST %DOOM2DIR%\*.NUM ECHO.

ECHO DOOM II: Done.
ECHO.

REM EW Snake

SET EWSNKDIR=%DOSGRDIR%\EWSNAKE

REM Backup highscores files
IF EXIST %EWSNKDIR%\*.05 ECHO EW Snake: Backing up highscores file
IF EXIST %EWSNKDIR%\*.05 XCOPY /I /Y "%EWSNKDIR%\*.05" "EWSNAKE"
IF EXIST %EWSNKDIR%\*.05 ECHO.

IF NOT EXIST %EWSNKDIR%\*.05 ECHO EW Snake: Highscores file not found. Skipping...
IF NOT EXIST %EWSNKDIR%\*.05 ECHO.
)

ECHO EW Snake: Done.
ECHO.

REM Freedoom

SET FDOOMDIR=%DOSGRDIR%\FREEDOOM

REM Backup screenshots in BMP and PCX format
IF EXIST %FDOOMDIR%\*.BMP ECHO Freedoom: Backing up BMP screenshots
IF EXIST %FDOOMDIR%\*.BMP XCOPY /I /Y "%FDOOMDIR%\*.BMP" "FREEDOOM\SCRNCAP"
IF EXIST %FDOOMDIR%\*.BMP ECHO.

IF NOT EXIST %FDOOMDIR%\*.BMP ECHO Freedoom: BMP screenshots not found. Skipping...
IF NOT EXIST %FDOOMDIR%\*.BMP ECHO.

IF EXIST %FDOOMDIR%\*.PCX ECHO Freedoom: Backing up PCX screenshots
IF EXIST %FDOOMDIR%\*.PCX XCOPY /I /Y "%FDOOMDIR%\*.PCX" "FREEDOOM\SCRNCAP"
IF EXIST %FDOOMDIR%\*.PCX ECHO.

IF NOT EXIST %FDOOMDIR%\*.PCX ECHO Freedoom: PCX screenshots not found. Skipping...
IF NOT EXIST %FDOOMDIR%\*.PCX ECHO.

REM Backup SMMU configuration
IF EXIST %FDOOMDIR%\*.CFG ECHO Freedoom: Backing up SMMU configuration
IF EXIST %FDOOMDIR%\*.CFG XCOPY /I /Y "%FDOOMDIR%\*.CFG" "FREEDOOM"
IF EXIST %FDOOMDIR%\*.CFG ECHO.

IF NOT EXIST %FDOOMDIR%\*.CFG ECHO Freedoom: SMMU configuration not found. Skipping...
IF NOT EXIST %FDOOMDIR%\*.CFG ECHO.

REM Backup SMMU savegames
IF EXIST %FDOOMDIR%\SMMUSAV*.DSG ECHO Freedoom: Backing up SMMU savegames
IF EXIST %FDOOMDIR%\SMMUSAV*.DSG XCOPY /I /Y "%FDOOMDIR%\SMMUSAV*.DSG" "FREEDOOM\SAVEGAME"
IF EXIST %FDOOMDIR%\SMMUSAV*.DSG ECHO.

IF NOT EXIST %FDOOMDIR%\SMMUSAV*.DSG ECHO Freedoom: SMMU savegames not found. Skipping...
IF NOT EXIST %FDOOMDIR%\SMMUSAV*.DSG ECHO.

REM Backup transition map
IF EXIST %FDOOMDIR%\*.DAT ECHO Freedoom: Backing up transition map
IF EXIST %FDOOMDIR%\*.DAT XCOPY /I /Y "%FDOOMDIR%\*.DAT" "FREEDOOM"
IF EXIST %FDOOMDIR%\*.DAT ECHO.

IF NOT EXIST %FDOOMDIR%\*.DAT ECHO Freedoom: Transition map not found. Skipping...
IF NOT EXIST %FDOOMDIR%\*.DAT ECHO.

ECHO Freedoom: Done.
ECHO.

REM Hangman

SET HANGMAND=%DOSGRDIR%\HANGMAN

REM Backup configuration file
IF EXIST %HANGMAND%\*.CFG ECHO Hangman: Backing up configuration file
IF EXIST %HANGMAND%\*.CFG XCOPY /I /Y "%HANGMAND%\*.CFG" "HANGMAN"
IF EXIST %HANGMAND%\*.CFG ECHO.

IF NOT EXIST %HANGMAND%\*.CFG ECHO Hangman: Configuration file not found. Skipping...
IF NOT EXIST %HANGMAND%\*.CFG ECHO.

ECHO Hangman: Done.
ECHO.

REM Heretic

SET HERETICD=%DOSGRDIR%\HERETIC

REM Backup temporary DM file
IF EXIST %HERETICD%\*.TMP ECHO Heretic: Backing up temporary DM file
IF EXIST %HERETICD%\*.TMP XCOPY /I /Y "%HERETICD%\*.TMP" "HERETIC"
IF EXIST %HERETICD%\*.TMP ECHO.

IF NOT EXIST %HERETICD%\*.TMP ECHO Heretic: Temporary DM file not found. Skipping...
IF NOT EXIST %HERETICD%\*.TMP ECHO.

REM Backup configuration files
IF EXIST %HERETICD%\*.CFG ECHO Heretic: Backing up configuration files
IF EXIST %HERETICD%\*.CFG XCOPY /I /Y "%HERETICD%\*.CFG" "HERETIC\CONFIG"
IF EXIST %HERETICD%\*.CFG ECHO.

IF NOT EXIST %HERETICD%\*.CFG ECHO Heretic: Configuration files not found. Skipping...
IF NOT EXIST %HERETICD%\*.CFG ECHO.

REM Backup savegames
IF EXIST %HERETICD%\HTICSAV*.HSG ECHO Heretic: Backing up savegames
IF EXIST %HERETICD%\HTICSAV*.HSG XCOPY /I /Y "%HERETICD%\HTICSAV*.HSG" "HERETIC\SAVEGAME"
IF EXIST %HERETICD%\HTICSAV*.HSG ECHO.

IF NOT EXIST %HERETICD%\HTICSAV*.HSG ECHO Heretic: Savegames not found. Skipping...
IF NOT EXIST %HERETICD%\HTICSAV*.HSG ECHO.

REM Backup modem numbers file
IF EXIST %HERETICD%\*.NUM ECHO Heretic: Backing up modem numbers file
IF EXIST %HERETICD%\*.NUM XCOPY /I /Y "%HERETICD%\*.NUM" "HERETIC"
IF EXIST %HERETICD%\*.NUM ECHO.

IF NOT EXIST %HERETICD%\*.NUM ECHO Heretic: Modem numbers file not found. Skipping...
IF NOT EXIST %HERETICD%\*.NUM ECHO.

ECHO Heretic: Done.
ECHO.

REM Jill of the Jungle

SET JOTJDIR=%DOSGRDIR%\JILL

REM Backup configuration
IF EXIST %JOTJDIR%\JILL*.CFG ECHO Jill of the Jungle: Backing up configuration
IF EXIST %JOTJDIR%\JILL*.CFG XCOPY /I /Y "%JOTJDIR%\JILL*.CFG" "JOTJ\CONFIG"
IF EXIST %JOTJDIR%\JILL*.CFG ECHO.

IF NOT EXIST %JOTJDIR%\JILL*.CFG ECHO Jill of the Jungle: Configuration not found. Skipping...
IF NOT EXIST %JOTJDIR%\JILL*.CFG ECHO.

REM Backup savegame files
REM
REM To explain why JN*SAVE*.* is used. The first asterisk/wildcard concerns
REM itself with the episode number, e.g. 1, 2 and 3. The second one gets all the
REM files, including with the M ending and finally, the third one takes up the
REM savegame slot number which is at the same time the file ending.
IF EXIST %JOTJDIR%\JN*SAVE*.* ECHO Jill of the Jungle: Backing up savegame files
IF EXIST %JOTJDIR%\JN*SAVE*.* XCOPY /I /Y "%JOTJDIR%\JN*SAVE*.*" "JOTJ\SAVEGAME"
IF EXIST %JOTJDIR%\JN*SAVE*.* ECHO.

IF NOT EXIST %JOTJDIR%\JN*SAVE*.* ECHO Jill of the Jungle: Savegame files not found. Skipping...
IF NOT EXIST %JOTJDIR%\JN*SAVE*.* ECHO.

REM Backup TEMP file
IF EXIST %JOTJDIR%\TEMP ECHO Jill of the Jungle: Backing up TEMP file
IF EXIST %JOTJDIR%\TEMP XCOPY /I /Y "%JOTJDIR%\TEMP" "JOTJ"
IF EXIST %JOTJDIR%\TEMP ECHO.

IF NOT EXIST %JOTJDIR%\TEMP ECHO Jill of the Jungle: TEMP file not found. Skipping...
IF NOT EXIST %JOTJDIR%\TEMP ECHO.

ECHO Jill of the Jungle: Done.
ECHO.

REM Kiloblaster

SET KILOBDIR=%DOSGRDIR%\KILOBLAS

REM Backup configuration
IF EXIST %KILOBDIR%\CONFIG.KB* ECHO Kiloblaster: Backing up configuration
IF EXIST %KILOBDIR%\CONFIG.KB* XCOPY /I /Y "%KILOBDIR%\CONFIG.KB*" "KILOB\CONFIG"
IF EXIST %KILOBDIR%\CONFIG.KB* ECHO.

IF NOT EXIST %KILOBDIR%\CONFIG.KB* ECHO Kiloblaster: Configuration not found. Skipping...
IF NOT EXIST %KILOBDIR%\CONFIG.KB* ECHO.

REM Backup savegames
IF EXIST %KILOBDIR%\KB*_SAVE.* ECHO Kiloblaster: Backing up savegames
IF EXIST %KILOBDIR%\KB*_SAVE.* XCOPY /I /Y "%KILOBDIR%\KB*_SAVE.*" "KILOB\SAVEGAME"
IF EXIST %KILOBDIR%\KB*_SAVE.* ECHO.

IF NOT EXIST %KILOBDIR%\KB*_SAVE.* ECHO Kiloblaster: Savegames not found. Skipping...
IF NOT EXIST %KILOBDIR%\KB*_SAVE.* ECHO.

REM Backup KFILEB.BAT
REM
REM The date and time data of this file is for some reason modified by the game
IF EXIST %KILOBDIR%\KFILEB.BAT ECHO Kiloblaster: Backing up KFILEB.BAT
IF EXIST %KILOBDIR%\KFILEB.BAT XCOPY /I /Y "%KILOBDIR%\KFILEB.BAT" "KILOB"
IF EXIST %KILOBDIR%\KFILEB.BAT ECHO.

IF NOT EXIST %KILOBDIR%\KFILEB.BAT ECHO Kiloblaster: KFILEB.BAT not found. Skipping...
IF NOT EXIST %KILOBDIR%\KFILEB.BAT ECHO.

ECHO Kiloblaster: Done.
ECHO.

REM Leisure Suit Larry 5

SET LSL5DIR=%DOSGRDIR%\LARRY5

REM Backup savegames
REM
REM One thing that might be problematic at this point because of the .0*
REM wildcard syntax is that it won't work with a three digit number starting at
REM at anything except 0. It usually goes like LSL5SG.000 and the file ending
REM number simply increments by one. So this will be fine for savegames 000-099,
REM but probably fails at savegame 100 or higher. One way to solve this is to
REM simply use the .* syntax and get all savegames and the directory file in one
REM fell swoop. That however, is not explicit enough since it doesn't
REM differentiate between the directory file and actual savegames.
REM
REM IF EXIST %LSL5DIR%\LSL5SG.* ECHO Leisure Suit Larry 5: Backing up savegame files
REM IF EXIST %LSL5DIR%\LSL5SG.* XCOPY /I /Y "%LSL5DIR%\LSL5SG*.0*" "LARRY5\SAVEGAME"
REM IF EXIST %LSL5DIR%\LSL5SG.* ECHO.
REM
REM IF NOT EXIST %LSL5DIR%\LSL5SG.* ECHO Leisure Suit Larry 5: Savegame files not found. Skipping...
REM IF NOT EXIST %LSL5DIR%\LSL5SG.* ECHO.

IF EXIST %LSL5DIR%\LSL5SG.0* ECHO Leisure Suit Larry 5: Backing up savegames
IF EXIST %LSL5DIR%\LSL5SG.0* XCOPY /I /Y "%LSL5DIR%\LSL5SG*.0*" "LARRY5\SAVEGAME"
IF EXIST %LSL5DIR%\LSL5SG.0* ECHO.

IF NOT EXIST %LSL5DIR%\LSL5SG.0* ECHO Leisure Suit Larry 5: Savegames not found. Skipping...
IF NOT EXIST %LSL5DIR%\LSL5SG.0* ECHO.

REM Backup savegame directory file
IF EXIST %LSL5DIR%\LSL5SG.DIR ECHO Leisure Suit Larry 5: Backing up savegame directory file
IF EXIST %LSL5DIR%\LSL5SG.DIR XCOPY /I /Y "%LSL5DIR%\LSL5SG.DIR" "LARRY5\SAVEGAME"
IF EXIST %LSL5DIR%\LSL5SG.DIR ECHO.

IF NOT EXIST %LSL5DIR%\LSL5SG.DIR ECHO Leisure Suit Larry 5: Savegame directory file not found. Skipping...
IF NOT EXIST %LSL5DIR%\LSL5SG.DIR ECHO.

REM Backup configuration file
IF EXIST %LSL5DIR%\RESOURCE.CFG ECHO Leisure Suit Larry 5: Backing up configuration
IF EXIST %LSL5DIR%\RESOURCE.CFG XCOPY /I /Y "%LSL5DIR%\RESOURCE.CFG" "LARRY5"
IF EXIST %LSL5DIR%\RESOURCE.CFG ECHO.

IF NOT EXIST %LSL5DIR%\RESOURCE.CFG ECHO Leisure Suit Larry 5: Configuration not found. Skipping...
IF NOT EXIST %LSL5DIR%\RESOURCE.CFG ECHO.

ECHO Leisure Suit Larry 5: Done.
ECHO.

REM Liquid War

SET LWDIR=%DOSGRDIR%\LIQUIWAR

REM Backup configuration
IF EXIST %LWDIR%\*.CFG ECHO Liquid War: Backing up configuration
IF EXIST %LWDIR%\*.CFG XCOPY /I /Y "%LWDIR%\*.CFG" "LWAR"
IF EXIST %LWDIR%\*.CFG ECHO.

IF NOT EXIST %LWDIR%\*.CFG ECHO Liquid War: Configuration not found. Skipping...
IF NOT EXIST %LWDIR%\*.CFG ECHO.

REM Backup log file
IF EXIST %LWDIR%\*.LOG ECHO Liquid War: Backing up log file
IF EXIST %LWDIR%\*.LOG XCOPY /I /Y "%LWDIR%\*.LOG" "LWAR"
IF EXIST %LWDIR%\*.LOG ECHO.

IF NOT EXIST %LWDIR%\*.LOG ECHO Liquid War: Log file not found. Skipping...
IF NOT EXIST %LWDIR%\*.LOG ECHO.

ECHO Liquid War: Done.
ECHO.

REM Nethack

SET NETHACKD=%DOSGRDIR%\NETHACK

REM Backup bones files
REM
REM Bones files in the case of Nethack can look like this:
REM
REM NETHACK
REM  - BONM0.1
REM  - BOND0.4
REM
REM The first asterisk should work for the fourth, random letter and the
REM second one takes care of the random number in the end.
IF EXIST %NETHACKD%\BON*0.* ECHO Nethack: Backing up bones files
IF EXIST %NETHACKD%\BON*0.* XCOPY /I /Y "%NETHACKD%\BON*0.*" "NETHACK\BONES"
IF EXIST %NETHACKD%\BON*0.* ECHO.

IF NOT EXIST %NETHACKD%\BON*0.* ECHO Nethack: Bones files not found. Skipping...
IF NOT EXIST %NETHACKD%\BON*0.* ECHO.

REM Backup character savegames
IF EXIST %NETHACKD%\*.SAV ECHO Nethack: Backing up character savegames
IF EXIST %NETHACKD%\*.SAV XCOPY /I /Y "%NETHACKD%\*.SAV" "NETHACK\SAVEGAME"
IF EXIST %NETHACKD%\*.SAV ECHO.

IF EXIST %NETHACKD%\*.SAV ECHO Nethack: Character savegames not found. Skipping...
IF EXIST %NETHACKD%\*.SAV ECHO.

REM Sometimes, I am not sure under what circumstances, savegames are saved with
REM a numeric file ending instead of *.SAV. All I know is, that if a particular
REM ingame event triggers this, it creates one or multiple files:
REM
REM NETHACK
REM  - {CHARNAME}.0
REM  - {CHARNAME}.1
REM
REM It is likely, that when such savegame files exist while at the same time
REM there are bones files as well, that this will also copy them over. The
REM following code is therefore considered buggy.
IF EXIST %NETHACKD%\*.0 IF EXIST %NETHACKD%\*.1 ECHO Nethack: Backing up savegames with numeric file ending.
IF EXIST %NETHACKD%\*.0 XCOPY /I /Y "%NETHACKD%\*.0" "NETHACK\SAVEGAME"
IF EXIST %NETHACKD%\*.1 XCOPY /I /Y "%NETHACKD%\*.1" "NETHACK\SAVEGAME"
IF EXIST %NETHACKD%\*.0 IF EXIST %NETHACKD%\*.1 ECHO.

IF NOT EXIST %NETHACKD%\*.0 IF NOT EXIST %NETHACKD%\*.1 ECHO Nethack: Numeric file ending savegames not found. Skipping...
IF NOT EXIST %NETHACKD%\*.0 IF NOT EXIST %NETHACKD%\*.1 ECHO.

REM Backup log file
IF EXIST %NETHACKD%\LOGFILE ECHO Nethack: Backing up log file
IF EXIST %NETHACKD%\LOGFILE XCOPY /I /Y "%NETHACKD%\LOGFILE" "NETHACK"
IF EXIST %NETHACKD%\LOGFILE ECHO.

IF EXIST %NETHACKD%\LOGFILE ECHO Nethack: Log file not found. Skipping...
IF EXIST %NETHACKD%\LOGFILE ECHO.

REM Backup records
IF EXIST %NETHACKD%\RECORD ECHO Nethack: Backing up records
IF EXIST %NETHACKD%\RECORD XCOPY /I /Y "%NETHACKD%\RECORD" "NETHACK"
IF EXIST %NETHACKD%\RECORD ECHO.

IF EXIST %NETHACKD%\RECORD ECHO Nethack: Records not found. Skipping...
IF EXIST %NETHACKD%\RECORD ECHO.

ECHO Nethack: Done.
ECHO.

REM Paku Paku

SET PAKUDIR=%DOSGRDIR%\PAKUPAKU

REM Backup highscores
IF EXIST %PAKUDIR%\*.DAT ECHO Paku Paku: Backing up highscores
IF EXIST %PAKUDIR%\*.DAT XCOPY /I /Y "%PAKUDIR%\*.DAT" "PAKUPAKU"
IF EXIST %PAKUDIR%\*.DAT ECHO.

IF NOT EXIST %PAKUDIR%\*.DAT ECHO Paku Paku: Highscores not found. Skipping...
IF NOT EXIST %PAKUDIR%\*.DAT ECHO.

ECHO Paku Paku: Done.
ECHO.

REM Quake

SET QUAKEDIR=%DOSGRDIR%\QUAKE

REM Backup configuration files
IF EXIST %QUAKEDIR%\ID1\*.CFG ECHO Quake: Backing up configuration files
IF EXIST %QUAKEDIR%\ID1\*.CFG XCOPY /I /Y "%QUAKEDIR%\ID1\*.CFG" "QUAKE\CONFIG"
IF EXIST %QUAKEDIR%\ID1\*.CFG ECHO.

IF NOT EXIST %QUAKEDIR%\ID1\*.CFG ECHO Quake: Configuration files not found. Skipping...
IF NOT EXIST %QUAKEDIR%\ID1\*.CFG ECHO.

REM Backup PCX format screenshots
IF EXIST %QUAKEDIR%\ID1\QUAKE*.PCX ECHO Quake: Backing up PCX screenshots
IF EXIST %QUAKEDIR%\ID1\QUAKE*.PCX XCOPY /I /Y "%QUAKEDIR%\ID1\QUAKE*.PCX" "QUAKE\SCRNCAP"
IF EXIST %QUAKEDIR%\ID1\QUAKE*.PCX ECHO.

IF NOT EXIST %QUAKEDIR%\ID1\QUAKE*.PCX ECHO Quake: PCX screenshots not found. Skipping...
IF NOT EXIST %QUAKEDIR%\ID1\QUAKE*.PCX ECHO.

REM Backup quicksave
IF EXIST %QUAKEDIR%\ID1\QUICK.SAV ECHO Quake: Backing up quicksave
IF EXIST %QUAKEDIR%\ID1\QUICK.SAV XCOPY /I /Y "%QUAKEDIR%\ID1\QUICK.SAV" "QUAKE\SAVEGAME"
IF EXIST %QUAKEDIR%\ID1\QUICK.SAV ECHO.

IF NOT EXIST %QUAKEDIR%\ID1\QUICK.SAV ECHO Quake: Quicksave not found. Skipping...
IF NOT EXIST %QUAKEDIR%\ID1\QUICK.SAV ECHO.

REM Backup savegames
IF EXIST %QUAKEDIR%\ID1\S*.SAV ECHO Quake: Backing up savegames
IF EXIST %QUAKEDIR%\ID1\S*.SAV XCOPY /I /Y %QUAKEDIR%\ID1\S*.SAV "QUAKE\SAVEGAME"
IF EXIST %QUAKEDIR%\ID1\S*.SAV ECHO.

IF NOT EXIST %QUAKEDIR%\ID1\S*.SAV ECHO Quake: Savegames not found. Skipping...
IF NOT EXIST %QUAKEDIR%\ID1\S*.SAV ECHO.

ECHO Quake: Done.
ECHO.

REM SECRET AGENT

SET SECAGNTD=%DOSGRDIR%\SAM

REM Backup configuration and highscores
IF EXIST %SECAGNTD%\SAM*.CFG ECHO SECRET AGENT: Backing up configuration and highscores
IF EXIST %SECAGNTD%\SAM*.CFG XCOPY /I /Y "%SECAGNT%\SAM*.CFG" "SECAGENT\CONFIG"
IF EXIST %SECAGNTD%\SAM*.CFG ECHO.

IF NOT EXIST %SECAGNTD%\SAM*.CFG ECHO SECRET AGENT: Configuration and highscores files not found. Skipping...
IF NOT EXIST %SECAGNTD%\SAM*.CFG ECHO.

REM Backup savegames
IF EXIST %SECAGNTD%\SAM*-*.SAV ECHO SECRET AGENT: Backing up savegames
IF EXIST %SECAGNTD%\SAM*-*.SAV XCOPY /I /Y "%SECAGNT%\SAM*-*.SAV" "SECAGENT\SAVEGAME"
IF EXIST %SECAGNTD%\SAM*-*.SAV ECHO.

IF NOT EXIST %SECAGNTD%\SAM*-*.SAV ECHO SECRET AGENT: Savegames not found. Skipping...
IF NOT EXIST %SECAGNTD%\SAM*-*.SAV ECHO.

ECHO SECRET AGENT: Done.
ECHO.

REM Shadow Warrior

SET SWDIR=%DOSGRDIR%\SW

REM Backup configuration files
IF EXIST %SWDIR%\*.CFG ECHO Shadow Warrior: Backing up configuration files
IF EXIST %SWDIR%\*.CFG XCOPY /I /Y "%SWDIR%\*.CFG" "SWARRIOR\CONFIG"
IF EXIST %SWDIR%\*.CFG ECHO.

IF NOT EXIST %SWDIR%\*.CFG ECHO Shadow Warrior: Configuration files not found. Skipping...
IF NOT EXIST %SWDIR%\*.CFG ECHO.

REM Backup savegames
IF EXIST %SWDIR%\GAME*.SAV ECHO Shadow Warrior: Backing up savegames
IF EXIST %SWDIR%\GAME*.SAV XCOPY /I /Y "%SWDIR%\GAME*.SAV" "SWARRIOR\SAVEGAME"
IF EXIST %SWDIR%\GAME*.SAV ECHO.

IF NOT EXIST %SWDIR%\GAME*.SAV ECHO Shadow Warrior: Savegames not found. Skipping...
IF NOT EXIST %SWDIR%\GAME*.SAV ECHO.

REM Backup PCX format screenshots
IF EXIST %SWDIR%\SWCP*.PCX ECHO Shadow Warrior: Backing up PCX screenshots
IF EXIST %SWDIR%\SWCP*.PCX XCOPY /I /Y "%SWDIR%\SWCP*.PCX" "SWARRIOR\SCRNCAP"
IF EXIST %SWDIR%\SWCP*.PCX ECHO.

IF NOT EXIST %SWDIR%\SWCP*.PCX ECHO Shadow Warrior: PCX screenshots not found. Skipping...
IF NOT EXIST %SWDIR%\SWCP*.PCX ECHO.

ECHO Shadow Warrior: Done.
ECHO.

REM TEENAGENT

SET TAGNTDIR=%DOSGRDIR%\TEENAGNT

REM Backup sound settings
IF EXIST %TAGNTDIR%\SOUND.SET ECHO TEENAGENT: Backing up sound settings
IF EXIST %TAGNTDIR%\SOUND.SET XCOPY /I /Y "%TAGNTDIR%\SOUND.SET" "TEENAGNT"
IF EXIST %TAGNTDIR%\SOUND.SET ECHO.

IF NOT EXIST %TAGNTDIR%\SOUND.SET ECHO TEENAGENT: Sound settings not found. Skipping...
IF NOT EXIST %TAGNTDIR%\SOUND.SET ECHO.

REM Backup savegames
IF EXIST %TAGNTDIR%\TEENAGE*.SAV ECHO TEENAGENT: Backing up sound savegames
IF EXIST %TAGNTDIR%\TEENAGE*.SAV XCOPY /I /Y "%TAGNTDIR%\TEENAGE*.SAV" "TEENAGNT\SAVEGAME"
IF EXIST %TAGNTDIR%\TEENAGE*.SAV ECHO.

IF NOT EXIST %TAGNTDIR%\TEENAGE*.SAV ECHO TEENAGENT: Savegames not found. Skipping...
IF NOT EXIST %TAGNTDIR%\TEENAGE*.SAV ECHO.

ECHO TEENAGENT: Done.
ECHO.

REM TETRIS Queen

SET QTETRISD=%DOSGRDIR%\QTETRIS

REM Backup configuration
IF EXIST %QTETRISD%\*.CFG ECHO TETRIS Queen: Backing up configuration
IF EXIST %QTETRISD%\*.CFG XCOPY /I /Y "%QTETRISD%\*.CFG" "QTETRIS"
IF EXIST %QTETRISD%\*.CFG ECHO.

IF NOT EXIST %QTETRISD%\*.CFG ECHO TETRIS Queen: Configuration not found. Skipping...
IF NOT EXIST %QTETRISD%\*.CFG ECHO.

REM Backup "Hall of Fame"
IF EXIST %QTETRISD%\*.HOF ECHO TETRIS Queen: Backing up "Hall of Fame"
IF EXIST %QTETRISD%\*.HOF XCOPY /I /Y "%QTETRISD%\*.HOF" "QTETRIS"
IF EXIST %QTETRISD%\*.HOF ECHO.

IF NOT EXIST %QTETRISD%\*.HOF ECHO TETRIS Queen: "Hall of Fame" not found. Skipping...
IF NOT EXIST %QTETRISD%\*.HOF ECHO.

ECHO TETRIS Queen: Done.
ECHO.

REM Tyrian 2000

SET T2KDIR=%DOSGRDIR%\TYRIAN2K

REM Backup NEWSH_~6.SHP
REM
REM This one is a little bit weird. There are multiple SHP files in the root
REM directory of Tyrian 2000, which very likely have something to do with ship
REM customisation. Yet this particular file seems to dynamically change even
REM when not modifying anything; each time the game is started, played and
REM closed.
IF EXIST %T2KDIR%\NEWSH_~6.SHP ECHO Tyrian 2000: Backing up NEWSH_~6.SHP
IF EXIST %T2KDIR%\NEWSH_~6.SHP XCOPY /I /Y "%T2KDIR%\NEWSH_~6.SHP" "TYRIAN2K"
IF EXIST %T2KDIR%\NEWSH_~6.SHP ECHO.

IF NOT EXIST %T2KDIR%\NEWSH_~6.SHP ECHO Tyrian 2000: NEWSH_~6.SHP not found. Skipping...
IF NOT EXIST %T2KDIR%\NEWSH_~6.SHP ECHO.

REM Backup SETUP.BOX file
IF EXIST %T2KDIR%\*.BOX ECHO Tyrian 2000: Backing up SETUP.BOX file
IF EXIST %T2KDIR%\*.BOX XCOPY /I /Y "%T2KDIR%\*.BOX" "TYRIAN2K"
IF EXIST %T2KDIR%\*.BOX ECHO.

IF NOT EXIST %T2KDIR%\*.BOX ECHO Tyrian 2000: SETUP.BOX file not found. Skipping...
IF NOT EXIST %T2KDIR%\*.BOX ECHO.

REM Backup log file
IF EXIST %T2KDIR%\*.LOG ECHO Tyrian 2000: Backing up log file
IF EXIST %T2KDIR%\*.LOG XCOPY /I /Y "%T2KDIR%\*.LOG" "TYRIAN2K"
IF EXIST %T2KDIR%\*.LOG ECHO.

IF NOT EXIST %T2KDIR%\*.LOG ECHO Tyrian 2000: Log file not found. Skipping...
IF NOT EXIST %T2KDIR%\*.LOG ECHO.

REM Backup configuration
IF EXIST %T2KDIR%\*.CFG ECHO Tyrian 2000: Backing up configuration
IF EXIST %T2KDIR%\*.CFG XCOPY /I /Y "%T2KDIR%\*.CFG" "TYRIAN2K"
IF EXIST %T2KDIR%\*.CFG ECHO.

IF NOT EXIST %T2KDIR%\*.CFG ECHO Tyrian 2000: Configuration not found. Skipping...
IF NOT EXIST %T2KDIR%\*.CFG ECHO.

REM Backup HDT file
IF EXIST %T2KDIR%\*.HDT ECHO Tyrian 2000: Backing up HDT file
IF EXIST %T2KDIR%\*.HDT XCOPY /I /Y "%T2KDIR%\*.HDT" "TYRIAN2K"
IF EXIST %T2KDIR%\*.HDT ECHO.

IF NOT EXIST %T2KDIR%\*.HDT ECHO Tyrian 2000: HDT file not found. Skipping...
IF NOT EXIST %T2KDIR%\*.HDT ECHO.

REM Backup savegame
REM
REM Seems that there is only one savegame file
IF EXIST %T2KDIR%\*.SAV ECHO Tyrian 2000: Backing up savegame file
IF EXIST %T2KDIR%\*.SAV XCOPY /I /Y "%T2KDIR%\*.SAV" "TYRIAN2K"
IF EXIST %T2KDIR%\*.SAV ECHO.

IF NOT EXIST %T2KDIR%\*.SAV ECHO Tyrian 2000: Savegame file not found. Skipping...
IF NOT EXIST %T2KDIR%\*.SAV ECHO.

ECHO Tyrian 2000: Done.
ECHO.

REM Vertigo

SET VERTIGOD=%DOSGRDIR%\VERTIGO

REM Backup sound configuration
IF EXIST %VERTIGOD%\*.CFG ECHO Vertigo: Backing up sound configuration
IF EXIST %VERTIGOD%\*.CFG XCOPY /I /Y "%VERTIGOD%\*.CFG" "VERTIGO"
IF EXIST %VERTIGOD%\*.CFG ECHO.

IF NOT EXIST %VERTIGOD%\*.CFG ECHO Vertigo: Sound configuration not found. Skipping...
IF NOT EXIST %VERTIGOD%\*.CFG ECHO.

REM Backup VER_CFG.GCC
IF EXIST %VERTIGOD%\*.GCC ECHO Vertigo: Backing up VER_CFG.GCC
IF EXIST %VERTIGOD%\*.GCC XCOPY /I /Y "%VERTIGOD%\*.GCC" "VERTIGO"
IF EXIST %VERTIGOD%\*.GCC ECHO.

IF NOT EXIST %VERTIGOD%\*.GCC ECHO Vertigo: VER_CFG.GCC not found. Skipping...
IF NOT EXIST %VERTIGOD%\*.GCC ECHO.

ECHO Vertigo: Done.
ECHO.

REM WING (WING Is Not Galaga)

SET WINGDIR=%DOSGRDIR%\WING

REM Backup highscores
IF EXIST %WINGDIR%\*.DAT ECHO WING [WING Is Not Galaga]: Backing up highscores
IF EXIST %WINGDIR%\*.DAT XCOPY /I /Y "%WINGDIR%\*.DAT" "WING"
IF EXIST %WINGDIR%\*.DAT ECHO.

IF NOT EXIST %WINGDIR%\*.DAT ECHO WING [WING Is Not Galaga]: Highscores not found. Skipping...
IF NOT EXIST %WINGDIR%\*.DAT ECHO.

ECHO WING [WING Is Not Galaga]: Done.
ECHO.

REM Wolfenstein 3-D

SET WOLF3DRD=%DOSGRDIR%\WOLF3D

REM Backup configuration and highscores
IF EXIST %WOLF3DRD%\CONFIG.WL6 ECHO Wolfenstein 3-D: Backing up configuration and highscores
IF EXIST %WOLF3DRD%\CONFIG.WL6 XCOPY /I /Y "%WOLF3DRD%\CONFIG.WL6" "WOLF3D"
IF EXIST %WOLF3DRD%\CONFIG.WL6 ECHO.

IF NOT EXIST %WOLF3DRD%\CONFIG.WL6 ECHO Wolfenstein 3-D: Configuration and highscores file not found. Skipping...
IF NOT EXIST %WOLF3DRD%\CONFIG.WL6 ECHO.

REM Backup savegames
IF EXIST %WOLF3DRD%\SAVEGAM*.WL6 ECHO Wolfenstein 3-D: Backing up savegames
IF EXIST %WOLF3DRD%\SAVEGAM*.WL6 XCOPY /I /Y "%WOLF3DRD%\SAVEGAM*.WL6" "WOLF3D\SAVEGAME"
IF EXIST %WOLF3DRD%\SAVEGAM*.WL6 ECHO.

IF NOT EXIST %WOLF3DRD%\SAVEGAM*.WL6 ECHO Wolfenstein 3-D: Savegames not found. Skipping...
IF NOT EXIST %WOLF3DRD%\SAVEGAM*.WL6 ECHO.

ECHO Wolfenstein 3-D: Done.
ECHO.

ECHO DOSRBC: Backup script is done.
ECHO.

PAUSE
