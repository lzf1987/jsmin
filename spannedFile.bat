@echo off
if exist RunJSMin.bat del RunJSMin.bat /q
:input
cls
set input=:
set /p input=Please input path:
set "input=%input:"=%"
:: �������Ϊ�ж�%input%���Ƿ�������ţ������޳���
if "%input%"==":" goto input
if not exist "%input%" goto input
for %%i in ("%input%") do if /i "%%~di"==%%i goto input
pushd %cd%
cd /d "%input%">nul 2>nul || exit
set cur_dir=%cd%
popd
@REM ���㵹����һ����б�ܵ�λ��
SETLOCAL ENABLEDELAYEDEXPANSION 
@REM ����PosLastChar����
call :PosLastChar %input% _ aa
@REM echo %aa%
@REM echo !input:~0,%aa%!
@REM pause
:: %%~nxiֻ��ʾ�ļ���,%%i��ʾ��·�����ļ���Ϣ
echo @echo off>>RunJSMin.bat
echo SET JSDir=%input%\>>RunJSMin.bat
@REM �½��ļ���
if exist !input:~0,%aa%!\minjs\(
   echo "�Ѿ������ļ���"
   set file=:
   set /p file=�Ƿ�ɾ��minjs�ļ���(Y/N):
   if /i "%file%"=="y" goto A
   if /i "%file%"=="n" goto B 
   :A
    del /f /s /q !input:~0,%aa%!\minjs\*.*
    rd /q /s !input:~0,%aa%!\minjs\
    md !input:~0,%aa%!\minjs\
   :B
    echo "��ɾ���ļ�����"
) else (
   md !input:~0,%aa%!\minjs\
)
echo SET JSNew=!input:~0,%aa%!\minjs\>>RunJSMin.bat
for /f "delims=" %%i in ('dir %input% /b ^| find/i "js"') do echo CALL JsMinfy.bat %%JSDir%% %%i %%JSNew%%>>RunJSMin.bat
if not exist RunJSMin.bat goto no_file
start RunJSMin.bat
exit

@REM PosLastChar����
PosLastChar str tag Res
:PosLastChar
set SubStr=
set F=0 
set TmpVar=%1
set %3=-1
:PosLastCharBegin
set SubStr=!TmpVar:~%F%,1!
if not defined substr goto :PosLastCharEnd 
if "%SubStr%"=="%\" (
set %3=%f%
set /a f=%f%+1
goto :PosLastCharBegin
) else (
set /a f=%f%+1
goto :PosLastCharBegin
)
:PosLastCharEnd
goto :eof

:no_file
cls
echo %cur_dir% Folder does not have a separate document
pause