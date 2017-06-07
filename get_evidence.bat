@echo on


REM get_evidence.bat v0.0.1
REM Rodrigo Costa - rc699t - 02/AUG/2016

REM This script is intended to login into an UNIX server
REM and get evidence from lssecfixes or test if a package is there


REM ==============================


REM Perfumaria
title get_evidence_v0.0.1

color a


REM ==============================


REM Variables
set plink="C:\Program Files (x86)\PuTTY\plink.exe"

set user=rc699t

set command_to_run="hostname; date; lspv | egrep '00f649b3e86120b5'; echo '##############################################################################'; echo '\n'; echo '\n'"

set user_home=%USERPROFILE%

set servers=servers.txt


REM ==============================

REM User input
REM set /p user=Please type your user name: 


REM Running the PLINK reading a list of servers

for /f %%i in (%servers%) do (

	%plink% %user%@%%i %command_to_run% >> %user_home%\output_UNIX.txt

)

REM Convert UNIX line ending to DOS line ending
TYPE %user_home%\output_UNIX.txt | MORE /P > %user_home%\output_DOS.txt


REM Delete UNIX output
del %user_home%\output_UNIX.txt


REM Opens the DOS output
start C:\Windows\System32\notepad.exe %user_home%\output_DOS.txt