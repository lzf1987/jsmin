@echo off
if exist RunJSMin.bat del RunJSMin.bat /q
:input
cls
set input=:
set /p input=Please input path:
set "input=%input:"=%"
:: 上面这句为判断%input%中是否存在引号，有则剔除。
if "%input%"==":" goto input
if not exist "%input%" goto input
for %%i in ("%input%") do if /i "%%~di"==%%i goto input
pushd %cd%
cd /d "%input%">nul 2>nul || exit
set cur_dir=%cd%
popd
@REM 计算倒数第一个反斜杠的位置
SETLOCAL ENABLEDELAYEDEXPANSION 
@REM 运行PosLastChar方法
call :PosLastChar %input% _ aa
@REM echo %aa%
@REM echo !input:~0,%aa%!
@REM pause
:: %%~nxi只显示文件名,%%i显示带路径的文件信息
echo @echo off>>RunJSMin.bat
echo SET JSDir=%input%\>>RunJSMin.bat
@REM 新建文件夹
if exist !input:~0,%aa%!\minjs\(
   echo "已经存在文件夹"
   set file=:
   set /p file=是否删除minjs文件夹(Y/N):
   if /i "%file%"=="y" goto A
   if /i "%file%"=="n" goto B 
   :A
    del /f /s /q !input:~0,%aa%!\minjs\*.*
    rd /q /s !input:~0,%aa%!\minjs\
    md !input:~0,%aa%!\minjs\
   :B
    echo "不删除文件！！"
) else (
   md !input:~0,%aa%!\minjs\
)
echo SET JSNew=!input:~0,%aa%!\minjs\>>RunJSMin.bat
for /f "delims=" %%i in ('dir %input% /b ^| find/i "js"') do echo CALL JsMinfy.bat %%JSDir%% %%i %%JSNew%%>>RunJSMin.bat
if not exist RunJSMin.bat goto no_file
start RunJSMin.bat
exit

@REM PosLastChar方法
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