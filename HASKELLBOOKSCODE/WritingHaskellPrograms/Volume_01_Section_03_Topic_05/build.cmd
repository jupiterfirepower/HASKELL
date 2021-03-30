@echo off
rem --------------------------------------------------------
rem
rem build.cmd
rem Code sample accompanying topic 1.3.5 "Pattern matching"
rem See README.md for details
rem
rem Fundamentals of Practical Haskell Programming
rem By Richard Cook
rem
rem --------------------------------------------------------

@echo off
setlocal
cd /d "%~dp0"

call :Compile Colour0 || goto :error
call :Compile Colour1 || goto :error
call :Compile Colour2 || goto :error
call :Compile Colour3 || goto :error
rem call :Compile Colour4 || goto :error
rem call :Compile Colour5 || goto :error
call :Compile Func || goto :error
goto :eof

:error
exit /b 1

:Compile
stack ghc -- ^
    --make ^
    -O0 ^
    -Wall ^
    -Werror ^
    -Wno-missing-signatures ^
    -Wno-type-defaults ^
    %~1.hs
goto :eof
