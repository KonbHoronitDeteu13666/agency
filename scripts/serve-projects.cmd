@echo off
rem Serves a folder on THIS computer only (127.0.0.1), port 8777, so that checking agents
rem can open the project pages in a real browser.
rem Usage: double-click = serves C:\Users\HP\Desktop\agency\projects
rem        drag a project folder onto this file = serves that folder
rem        serve-projects.cmd "C:\path\to\folder" from a terminal also works.
rem Stop it with Ctrl+C or by closing this window.
setlocal
set "DIR=%~1"
if "%DIR%"=="" set "DIR=C:\Users\HP\Desktop\agency\projects"
if "%DIR:~-1%"=="\" set "DIR=%DIR:~0,-1%"
echo Serving "%DIR%" on http://127.0.0.1:8777/  (this computer only). Close this window to stop.
py -3 -m http.server 8777 --bind 127.0.0.1 --directory "%DIR%"
