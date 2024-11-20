@echo off
title Minecraft Java Cleanup Wizard v1.0
:menu
echo Select a option from the list:
echo.
echo 1) Delete all Minecraft worlds
echo 2) Delete downloaded Minecraft versions [will re-download]
echo 3) Delete servers
echo 4) Restore servers from old server list
echo 5) Remove Server Resource Packs [will re-download]
echo 6) Delete Screenshots
echo 7) Delete local resource Packs
echo 8) Delete all mods
echo 9) Delete config for mods
echo 10) Delete cache for mods
echo 11) Exit
echo.
echo.
echo #10 may not work as it is deleting
echo cache from ".minecraft/.cache".
echo The launcher uses this for nothing.
echo Select a option and press ENTER/RETURN.
set /P optionToClean=">> "
rem Don't remove the space from set /P
rem optionToClean. Why? When the user types
rem something, it will have no space
rem between the >> and the user's
rem input.

rem         |
rem         v
rem Below are the selection list
rem for the user specification.

if /I "%optionToClean%" EQU "1" goto :delmcworld
if /I "%optionToClean%" EQU "2" goto :deldownloadmcver
if /I "%optionToClean%" EQU "3" goto :delservers
if /I "%optionToClean%" EQU "4" goto :restoreservers
if /I "%optionToClean%" EQU "5" goto :delserver_rp
if /I "%optionToClean%" EQU "6" goto :delscreenshots
if /I "%optionToClean%" EQU "7" goto :del_localrp
if /I "%optionToClean%" EQU "8" goto :delmods
if /I "%optionToClean%" EQU "9" goto :delmodconfig
if /I "%optionToClean%" EQU "10" goto :delmodcache
if /I "%optionToClean%" EQU "11" exit
echo Invalid answer or typo! Returning to home
echo screen in 5 seconds.
timeout 5 /nobreak > nul
goto :menu


:delmcworld
echo Deleting saves folder... [1/1]
del %appdata%\.minecraft\saves
goto :menu


:deldownloadmcver
echo Deleting downloaded minecraft versions... [1/1]
del %appdata%\.minecraft\versions
goto :menu


:delservers
echo Deleting servers data file... [1/1]
del %appdata%\.minecraft\servers.dat
goto :menu


:restoreservers
echo Copying old servers to server data file... [1/1]
copy %appdata%\.minecraft\servers.dat_old %appdata%\.minecraft\servers.dat
goto :menu


:delserver_rp
echo Deleting downloaded server resource packs... [1/1]
del %appdata%\.minecraft\downloads
goto :menu


:delscreenshots
echo Deleting all screenshots... [1/1]
del %appdata%\.minecraft\screenshots
goto :menu


:del_localrp
echo Deleting local resource packs... [1/1]
del %appdata%\.minecraft\resourcepacks
goto :menu


:delmods
echo Works on any mod loader as long as
echo the mods are in .minecraft/mods
echo Deleting installed mods... [1/1]
del %appdata%\.minecraft\mods
goto :menu


:delmodconfig
echo Deleting mod config... [1/1]
del %appdata%\.minecraft\config
goto :menu


:delmodcache
echo This may not work. This option will clear
echo the cache from .minecraft/.cache as mentioned
echo before.
echo Deleting mod cache [1/1]
del %appdata%\.minecraft\.cache
goto :menu


rem End of script.
rem Made by Infinite0Void on GitHub
rem Repo: Infinite0Void/mcCleanupWizard