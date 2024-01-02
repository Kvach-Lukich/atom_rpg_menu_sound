@echo off
if exist game_sounds_bkp (
move ..\AtomRPG_x64_Data\mainmenu.resource mainmenu.resource
del ..\AtomRPG_x64_Data\StreamingAssets\game_sounds
move game_sounds_bkp ..\AtomRPG_x64_Data\StreamingAssets\game_sounds
echo Done
) else (
echo No backup file
)

