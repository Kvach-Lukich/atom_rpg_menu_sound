@echo off
rem certutil -hashfile ..\AtomRPG_x64_Data\StreamingAssets\game_sounds MD5
SETLOCAL ENABLEDELAYEDEXPANSION
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`certutil -hashfile ..\AtomRPG_x64_Data\StreamingAssets\game_sounds MD5`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
if "!var2!"=="86 58 76 23 64 3f d6 41 c2 03 ce be 12 49 7b 10" (

move mainmenu.resource ..\AtomRPG_x64_Data\mainmenu.resource
move ..\AtomRPG_x64_Data\StreamingAssets\game_sounds game_sounds_bkp
xdelta3.exe -d -s game_sounds_bkp sound.diff ..\AtomRPG_x64_Data\StreamingAssets\game_sounds
echo Done
) else (
 echo MD5 mismatch
)
ENDLOCAL

