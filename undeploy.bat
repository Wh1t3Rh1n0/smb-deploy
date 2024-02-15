@echo off

cd /d "%~dp0"

if "%1"=="" (
    echo Usage: %0 ^<List of deployed files^>
    echo.
    echo Example: %0 output\successful_uploads.txt
    echo.
    echo Output is logged to '.\output'.
    goto end
)

set LIST=%1
set UPFILE=%2

mkdir output 2>nul
set LOG=output\undeploy_log.txt
set NOTDELLOG=output\unable_to_delete.txt

echo Starting at: %date% %time%

for /f "delims=?" %%i in ('type %LIST%') do (
    echo.
    echo --- TESTING "%%i" ---
    if not exist "%%i" (
        echo NOT FOUND: %%i
        echo NOT FOUND: %%i>> "%LOG%"
    ) else (
        del /f "%%i"
        if not exist "%%i" (
            echo SUCCESSFULLY DELETED: %%i
            echo SUCCESSFULLY DELETED: %%i>> "%LOG%"
        ) else (
            echo [!] COULD NOT DELETE: %%i
            echo [!] COULD NOT DELETE: %%i>> "%LOG%"
            echo %%i>> "%NOTDELLOG%"
        )
    )
)

echo Finished at: %date% %time%

:end