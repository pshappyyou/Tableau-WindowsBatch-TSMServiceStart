
@ECHO OFF
REM SET SvcName=%~1
SET SvcName=tabadmincontroller_0

SC QUERYEX "%SvcName%" | FIND "STATE" | FIND /v "RUNNING" > NUL && (
	PAUSE
	ECHO "%SvcName%" is not runnig
	ECHO START %SvcName%
	PAUSE
	NET START %SvcName% > NUL || (
		ECHO "%SvcName% wont start
		EXIT /B 1
	)
	
	ECHO "%SvcName%" is started
	EXIT /B 0
) || (
	ECHO "%SvcName%" is running
	EXIT /B 0
	)
PAUSE

REM tsm restart -u dpark -p Janu@123
