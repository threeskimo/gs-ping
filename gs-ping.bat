@echo off

::CHANGE THESE :::::::::::::::::::::::::::::::::::
set IP=8.8.8.8
set threshold=20
:::::::::::::::::::::::::::::::::::::::::::::::::::

:loop
ping %IP% -n 1 >nul

for /f "tokens=6 delims=time=" %%G in ('ping %IP% -n 1 ^| find "time="') do (
  set time=%%G
  
  if %time% GEQ %threshold% (
    echo Ping: %time% ms
	rundll32 user32.dll,MessageBeep
  ) else (
    echo Ping: %time% ms
  )
)

timeout /t 1 >nul
goto loop