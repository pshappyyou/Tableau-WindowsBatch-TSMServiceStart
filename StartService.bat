
@ECHO OFF
CLS

:MENU
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2 OR 3 to select your task, or 4 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Start Service
ECHO 2 - TSM restart
ECHO 3
ECHO 4 - EXIT
ECHO.

SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO SERVICE
IF %M%==2 GOTO TSM
IF %M%==3 GOTO CMD
IF %M%==4 GOTO EOF


:SERVICE
REM SET SvcName=%~1
SET SvcName=tabadmincontroller_0

SC QUERYEX "%SvcName%" | FIND "STATE" | FIND /v "RUNNING" > NUL && (
	ECHO "%SvcName%" is not runnig
	ECHO START %SvcName%
	NET START %SvcName% > NUL || (
		ECHO "%SvcName% wont start
REM		EXIT /B 1
		GOTO MENU
	)
	ECHO "%SvcName%" is started
	GOTO MENU
REM	EXIT /B 0
) || (
	ECHO "%SvcName%" is running
	GOTO MENU
REM	EXIT /B 0
	)
PAUSE
GOTO MENU
REM tsm restart -u dpark -p Janu@123

:TSM
ECHO tsm restart -u dpark -p Janu@123
tsm restart -u dpark -p Janu@123
PAUSE
GOTO MENU

	
