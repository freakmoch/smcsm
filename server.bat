@echo off
color f5
title Minecraft 1.7.10 Server
echo Snow Golems are backing up the server in 7z, please wait...
start /wait /D %appdata%\.minecraft\server\world backup.bat
echo Zombies cleared. Starting Server....
:restart
cls
start minecraft.exe
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
pause
SET /P ANSWER=Restart Server? (Y/N)
if /i {%ANSWER%}=={y} (goto :restart) 
if /i {%ANSWER%}=={yes} (goto :restart) 
goto :deli

:deli
SET /P ANSWER=Backup Server again? (Y/N)
if /i {%ANSWER%}=={y} (goto :backup) 
if /i {%ANSWER%}=={yes} (goto :backup) 
goto :out

:out
exit

:backup
cls
echo Zombies revived. Golems are saving the village, please wait..
start /wait /D %appdata%\.minecraft\server\world backup.bat
exit

