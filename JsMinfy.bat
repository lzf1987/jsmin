@REM �˙n�ǽo RunJSMin.bat �����õ�
@REM ��һ��������Ҫѹ���� JavaScript ����Ŀ�
@REM �ڶ���������Ҫѹ���� JavaScript �n��
@REM del ��ɾ��ָ���ļ�
@REM ren ������������
@REM @REM�Ǳ�ע����˼

set DirName=%1
set FileName=%2
set NewName=%3
echo %NewName%%FileName%
jsmin.exe < %DirName%%FileName% > %NewName%%FileName%
@REM del %DirName%%FileName%
@REM ren %NewName%%FileName%