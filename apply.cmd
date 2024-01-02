@echo off
rem certutil -hashfile ..\AtomRPG_x64_Data\StreamingAssets\game_sounds MD5
SETLOCAL ENABLEDELAYEDEXPANSION
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`certutil -hashfile ..\AtomRPG_x64_Data\StreamingAssets\game_sounds MD5`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
if "!var2!"=="d7 d2 03 75 24 4c fd ea b6 bf fa 48 29 78 f3 66" (

move mainmenu.resource ..\AtomRPG_x64_Data\mainmenu.resource
move ..\AtomRPG_x64_Data\StreamingAssets\game_sounds game_sounds_bkp
xdelta3.exe -d -s game_sounds_bkp sound.diff ..\AtomRPG_x64_Data\StreamingAssets\game_sounds
echo Done
) else (
 echo MD5 mismatch
)
ENDLOCAL

