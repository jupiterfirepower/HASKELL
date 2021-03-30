@echo off
rem --------------------------------------------------------
rem
rem build.cmd
rem Code sample accompanying topic 1.2.1 "Our first Haskell programs"
rem See README.md for details
rem
rem Fundamentals of Practical Haskell Programming
rem By Richard Cook
rem
rem --------------------------------------------------------

@echo off
setlocal
cd /d "%~dp0"

call :Compile Program1 || goto :error
call :Compile Program2 || goto :error
call :Compile Program3 || goto :error
call :Compile Program4 || goto :error
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
    -Wno-name-shadowing ^
    -Wno-type-defaults ^
    %~1.hs
goto :eof
