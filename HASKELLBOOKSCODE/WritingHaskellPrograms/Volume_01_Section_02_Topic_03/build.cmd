@echo off
rem --------------------------------------------------------
rem
rem build.cmd
rem Code sample accompanying topic 1.2.3 "GHCi and interactive Haskell"
rem See README.md for details
rem
rem Fundamentals of Practical Haskell Programming
rem By Richard Cook
rem
rem --------------------------------------------------------

@echo off
setlocal
cd /d "%~dp0"

call :Compile Program || goto :error
goto :eof

:error
exit /b 1

:Compile
stack ghc -- ^
    --make ^
    -O0 ^
    -Wall ^
    -Werror ^
    %~1.hs
goto :eof
