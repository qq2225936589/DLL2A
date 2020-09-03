@echo off
set dll=%1

if not defined dll (
  echo Usage: %~n0 [dll]
  exit /b
)
set def=%~dp1%~n1.def
echo %def%

dll2lib.exe /NOCLEAN %dll%
dlltool.exe -d %def% -D %dll% -k -l %~dp1%~n1.a

if exist %~dp1%~n1.exp del /q %~dp1%~n1.exp
if exist %~dp1%~n1.dmp del /q %~dp1%~n1.dmp
if exist %~dp1%~n1.lib del /q %~dp1%~n1.lib
