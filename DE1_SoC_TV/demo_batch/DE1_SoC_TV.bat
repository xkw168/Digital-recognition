@ REM ######################################
@ echo off

@set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin
@if exist %QUARTUS_BIN%\\quartus_pgm.exe (goto DownLoad)

@set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin64
@if exist %QUARTUS_BIN%\\quartus_pgm.exe (goto DownLoad)


:DownLoad
%QUARTUS_BIN%\\jtagconfig.exe > %%JTAG_INFO
IF ERRORLEVEL 1 goto error
setlocal enableextensions

rem check DE-SoC Board
for /f "tokens=2" %%a in (
%%JTAG_INFO
) do (
if %%a == DE-SoC goto Board_Ready
)

echo Can not find DE-SoC board, please check the hardware.
goto end


:Board_Ready
rem Find out device index
set /a Index=0
for /f "tokens=1" %%a in (
%%JTAG_INFO) do (
if %%a == 02D120DD goto Find_FPGA
set /a Index+=1
)

echo Can not find 5CSE(BA5|MA5)/5CSTFD5D5 FPGA Device, please check the hardware.
goto end


:Find_FPGA
::echo INDEX = %Index%
if %Index% == 1 goto Rev_B
if %Index% == 2 goto Rev_F

echo Device out of range(1 or 2), please check the hardware.
goto end


:Rev_B
echo ===========================================================
echo "DE1-SoC Rev B"
echo ===========================================================
goto Program_FPGA


:Rev_F
echo ===========================================================
echo "DE1-SoC Rev F"
echo ===========================================================


:Program_FPGA
@ REM ######################################
@ REM # Variable to ignore <CR> in DOS
@ REM # line endings
@ set SHELLOPTS=igncr

@ REM ######################################
@ REM # Variable to ignore mixed paths
@ REM # i.e. G:/$SOPC_KIT_NIOS2/bin
@ set CYGWIN=nodosfilewarning
%QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;DE1_SoC_TV.sof@%Index%"
goto end

:error
echo Please Check your USB Blaster!!


:end
echo Goodbye!!
del %%JTAG_INFO /F
endlocal

pause