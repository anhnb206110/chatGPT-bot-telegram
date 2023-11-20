@echo off
echo Starting deployment
@REM call :ExecuteCmd "%PYTHON_RUNTIME%" -m pip install --upgrade -r requirements.txt
@REM call :ExecuteCmd "%PYTHON_RUNTIME%" bot/main.py
call :ExecuteCmd docker-compose up -d
echo Finished successfully.
goto end

:ExecuteCmd
setlocal
set _CMD_=%*
call %_CMD_%
if "%ERRORLEVEL%" NEQ "0" echo Failed with error #%ERRORLEVEL%: %_CMD_% && exit /b %ERRORLEVEL%
endlocal
goto :eof

:end
