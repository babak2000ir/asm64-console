@echo off 
setlocal
REM usage compile.bat <filename>
set _filename=%~n1
set _extension=%~x1
REM ^<%_extension%^>
nasm -f win32 %_filename%.asm -o %_filename%.obj

@REM :waitloop
@REM IF EXIST %_filename%.obj GOTO waitloopend
@REM timeout /t 1
@REM goto waitloop
@REM :waitloopend

gcc %_filename%.obj -o %_filename%.exe
endlocal 
