@echo off
rem --------------------------------------------------------
rem
rem build.cmd
rem Code sample accompanying topic 1.2.2 "Whitespace, layout and scoping"
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
rem call :Compile Program3 || goto :error
rem call :Compile Program4 || goto :error
call :Compile Program5 || goto :error
call :Compile Program6 || goto :error
call :Compile Program7 || goto :error
call :Compile Program8 || goto :error
call :Compile Program9 || goto :error
call :Compile Program10 || goto :error
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
    -Wno-overlapping-patterns ^
    -Wno-type-defaults ^
    -Wno-unused-do-bind ^
    -fno-code ^
    -fno-warn-unused-local-binds ^
    -fno-warn-unused-matches ^
    -fno-warn-unused-top-binds ^
    %~1.hs
goto :eof
