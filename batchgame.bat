@echo off
echo This game will generate a random number from 1 to 10 and you have to guess it.
:LABEL1
echo Type a number from 1 to 10
set "input="
set /p input= 
IF NOT DEFINED input goto LABEL1
set /a num = %input%
if %num% LSS 1 goto LABEL2
if %num% GTR 10 goto LABEL3
SET /A test=%RANDOM%
SET /A test=%RANDOM% * 10 / 32768 + 1
if %num% EQU %test% goto LABEL4

echo You didn't guess the number!
echo The number is %test%
goto LABEL6

:LABEL2
echo Number is too small
goto LABEL1

:LABEL3
echo Number is too big
goto LABEL1

:LABEL4
echo You guessed the number correctly!

:LABEL6
echo Do you want to play again? No=n

set /p again= 
IF NOT DEFINED again goto LABEL1
if %again% == n exit
goto LABEL1