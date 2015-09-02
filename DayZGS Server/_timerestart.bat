@echo off
title DayZ Server AutoRestarter
color 0a 
:top
echo Autorestarter has been started at %time% !
timeout /t 10800
taskkill /f /im DayZServer54.exe
echo Server was restarted at %time%!
goto top