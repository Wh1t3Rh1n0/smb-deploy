@echo off

cd /d "%~dp0"

if "%2"=="" (
    echo Usage: %0 ^<List of SMB shares^> ^<File to Upload FROM THE CURRENT FOLDER^>
    echo.
    echo Example: %0 smb-shares.txt my-file.lnk
    echo.
    echo Output is logged to '.\output'.
    goto end
)

set LIST=%1
set UPFILE=%2

mkdir output 2>nul
set SUCCESSLOG=output\successful_uploads.txt
set WRITELOG=output\writable_folders.txt

echo Starting at: %date% %time%

for /f "delims=?" %%i in ('type %LIST%') do (
    echo.
    echo --- TESTING "%%i" ---
    if not exist "%%i\%UPFILE%" (
        echo "%%i\%UPFILE%" does not currently exist.
        copy "%UPFILE%" "%%i\"
        if exist "%%i\%UPFILE%" (
            echo "%%i\%UPFILE%" created successfully!
            echo %%i\%UPFILE% >> "%SUCCESSLOG%"
            echo %%i >> "%WRITELOG%"
        )
    ) else (
        echo "%%i\%UPFILE%" already exists. Skipping "%%i"
    )
)

echo Finished at: %date% %time%

:end