@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION 
rem ���� ��ǵ��޸� ԴĿ¼ �� Ŀ��Ŀ¼
rem ԴĿ¼
SET SrcPath=E:\example\Src\
rem Ŀ��Ŀ¼
SET DstPath=E:\example\Dst\
if not exist %DstPath% md %DstPath%
rem Ѱ�Һ�׺��Ϊ .jpg ���ļ�
SET FileExt=*.jpg 
for /f "delims=" %%i  in ('DIR  /b/a-d/s  %SrcPath%\%FileExt%')  do (
	SET srcFullName=%%~i
	SET shortFileName=%%~ni
	call:CopyFunc "!srcFullName!" "!shortFileName!"
)

ECHO ȫ������OK������
PAUSE
rem ���￪ʼ�����ļ�
:CopyFunc
SET "DstDir=%DstPath%%shortFileName%\����ͼ" 
rem ����Ŀ¼
if not exist %DstDir% md %DstDir%
rem �����ļ�
SET "dstFullName=%DstDir%\%shortFileName%.jpg" 
COPY %srcFullName% %dstFullName%
ECHO %srcFullName% ������� ...
