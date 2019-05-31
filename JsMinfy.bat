@REM 此檔是給 RunJSMin.bat 呼叫用的
@REM 第一個參數是要压缩的 JavaScript 所在目錄
@REM 第二個參數是要压缩的 JavaScript 檔名
@REM del 是删除指定文件
@REM ren 是批量重命名
@REM @REM是备注的意思

set DirName=%1
set FileName=%2
set NewName=%3
echo %NewName%%FileName%
jsmin.exe < %DirName%%FileName% > %NewName%%FileName%
@REM del %DirName%%FileName%
@REM ren %NewName%%FileName%