@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION 
rem 老婆 请记得修改 源目录 和 目标目录
rem 源目录
SET SrcPath=E:\example\Src\
rem 目标目录
SET DstPath=E:\example\Dst\
if not exist %DstPath% md %DstPath%
rem 寻找后缀名为 .jpg 的文件
SET FileExt=*.jpg 
for /f "delims=" %%i  in ('DIR  /b/a-d/s  %SrcPath%\%FileExt%')  do (
	SET srcFullName=%%~i
	SET shortFileName=%%~ni
	call:CopyFunc "!srcFullName!" "!shortFileName!"
)

ECHO 全部处理OK！！！
PAUSE
rem 这里开始复制文件
:CopyFunc
SET "DstDir=%DstPath%%shortFileName%\手淘图" 
rem 创建目录
if not exist %DstDir% md %DstDir%
rem 复制文件
SET "dstFullName=%DstDir%\%shortFileName%.jpg" 
COPY %srcFullName% %dstFullName%
ECHO %srcFullName% 处理完成 ...
