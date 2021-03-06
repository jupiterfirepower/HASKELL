@echo off
rem --------------------------------------------------------
rem
rem build.cmd
rem Code sample accompanying topic 1.1.2 "The FP Way"
rem See README.md for details
rem
rem Fundamentals of Practical Haskell Programming
rem By Richard Cook
rem
rem --------------------------------------------------------

@echo off
setlocal
cd /d "%~dp0"

call :Compile Composition || goto :error
call :Compile Filter || goto :error
call :Compile Reduction || goto :error
call :Compile Traversal || goto :error

call :CompileCpp Composition || goto :error
call :CompileCpp Filter || goto :error
call :CompileCpp Reduction || goto :error
call :CompileCpp Traversal || goto :error
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

:CompileCpp
cl /nologo /EHsc /Fe%~1_cpp.exe %~1.cpp
goto :eof
