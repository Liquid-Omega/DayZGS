@echo off
title DayZ ArenA Server Restarter
color 0a 
:top
echo Server has been started at %time% !
start /wait DayZServer54.exe -server -port=2302 -config=config\server.cfg -cfg=config\basic.cfg -profiles=dayzea.ChernarusPlus
echo Server has crashed at %time%, restarting!
color 0c
goto top
