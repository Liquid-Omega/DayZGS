@echo off
%~d0
rem cd "%~p0"
del *.log
del user_cfg\*.rpt
if "%PROCESSOR_ARCHITECTURE%" == "x86" (
	echo start 32-bit
	start DayZ_Launcher_x32.exe
) else (
	echo Start 64-bit
	start DayZ_Launcher_x64.exe
)
