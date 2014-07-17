@echo off
color f5
title Minecraft Launcher

:: Check if the server jar exists
:jar
if not exist "minecraft_server.jar" goto sero3 

:: Check if backup exists
if not exist ".\world\backup.bat" goto sero2 
if not exist ".\world\fin.vbs" goto sero2
if not exist ".\world\7za.exe" goto sero2 
echo Snow Golems are backing up the server in 7z, please wait...
:: Start the backup
start /wait /D %appdata%\.minecraft\server\world backup.bat
echo Zombies cleared. Starting Server....

cls
:: Start the Minecraft launcher if in the folder.
if not exist "minecraft.exe" goto sero
start minecraft.exe

:sero
:: Run the server
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
pause
SET /P ANSWER=Restart Server? (Y/N)
if /i {%ANSWER%}=={y} (goto :sero) 
if /i {%ANSWER%}=={yes} (goto :sero) 
goto :deli

:deli
:: Check if backup exists
if not exist ".\world\backup.bat" goto out 
if not exist ".\world\fin.vbs" goto out
if not exist ".\world\7za.exe" goto out 

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

:sero2
echo Backup tools are not present.
SET /P ANSWER=Start Server anyway? (Y/N)
if /i {%ANSWER%}=={y} (goto :sero) 
if /i {%ANSWER%}=={yes} (goto :sero) 
goto :out

:sero3
echo Backup tools are not present.
SET /P ANSWER=minecraft_server.jar not found. Retry? (Y/N)
if /i {%ANSWER%}=={y} (goto :jar) 
if /i {%ANSWER%}=={yes} (goto :jar) 
goto :out
