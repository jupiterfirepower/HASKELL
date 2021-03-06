@echo off
rem --------------------------------------------------------
rem
rem build.cmd
rem Code sample accompanying topic 1.1.3 "The Haskell Way"
rem See README.md for details
rem
rem Fundamentals of Practical Haskell Programming
rem By Richard Cook
rem
rem --------------------------------------------------------

@echo off
setlocal
cd /d "%~dp0"

call :Compile AddBrackets || goto :error
call :Compile ControlStructures || goto :error
call :Compile Factorial || goto :error
call :Compile NamingConventions || goto :error
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
    -fno-warn-unused-matches ^
    -fno-warn-unused-top-binds ^
    %~1.hs
goto :eof
