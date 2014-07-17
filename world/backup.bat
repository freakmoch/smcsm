@echo off
color f3
7za.exe a -t7z file.7z -x!backup.bat -x!7za.exe -x!backup.vbs -x!fin.vbs -x!backup*.bak
rename file.7z backup%RANDOM%.bak
move %appdata%\.minecraft\server\world\backup*.bak %appdata%\.minecraft\server\bk 
start fin.vbs
exit
