@echo off
rem Serves C:\Users\HP\Desktop\agency\projects on THIS computer only (127.0.0.1), port 8777,
rem so that checking agents can open project pages in a real browser.
rem Stop it with Ctrl+C or by closing this window.
echo Serving projects on http://127.0.0.1:8777/  (localhost only). Close this window to stop.
py -3 -m http.server 8777 --bind 127.0.0.1 --directory C:\Users\HP\Desktop\agency\projects
