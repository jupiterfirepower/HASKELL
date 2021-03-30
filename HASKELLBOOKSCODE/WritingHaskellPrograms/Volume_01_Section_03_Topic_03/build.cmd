@echo off
rem --------------------------------------------------------
rem
rem build.cmd
rem Code sample accompanying topic 1.3.3 "Algebraic data types"
rem See README.md for details
rem
rem Fundamentals of Practical Haskell Programming
rem By Richard Cook
rem
rem --------------------------------------------------------

@echo off
setlocal
cd /d "%~dp0"

call :Compile ColourRGB || goto :error
call :Compile ColourRGBCMYK || goto :error
call :Compile ColourRGBRecord || goto :error
call :Compile ColourSimpleSumType || goto :error

call :CompileCpp ColourSimpleEnum || goto :error
call :CompileCpp ColourStruct || goto :error
call :CompileCpp ColourTaggedUnion || goto :error
goto :eof

:error
exit /b 1

:Compile
stack ghc -- ^
    --make ^
    -O0 ^
    -Wall ^
    -Werror ^
    -fno-code ^
    -fno-warn-unused-top-binds ^
    %~1.hs
goto :eof

:CompileCpp
cl /nologo /EHsc -c %~1.cpp
goto :eof
