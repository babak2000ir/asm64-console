@echo off 
setlocal
PATH=%PATH%;C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Tools\MSVC\14.35.32215\bin\Hostx64\x64
@REM usage compile.bat <filename>
set _filename=%~n1
set _extension=%~x1
@REM ^<%_extension%^>
nasm -f win64 %_filename%.asm -o %_filename%.obj

@REM :waitloop
@REM IF EXIST %_filename%.obj GOTO waitloopend
@REM timeout /t 1
@REM goto waitloop
@REM :waitloopend

link %_filename%.obj kernel32.lib /subsystem:console /entry:main /out:%_filename%.exe /libpath:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22000.0\um\x64"

@REM ml64.exe %_filename%.obj  /link /subsystem:console /entry:main
@REM kernel32.lib user32.lib
endlocal 
