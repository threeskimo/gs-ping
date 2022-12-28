@echo off

::CHANGE THESE :::::::::::::::::::::::::::::::::::
set moonlight_ip=192.168.1.185
set ping_threshold=25
:::::::::::::::::::::::::::::::::::::::::::::::::::

:loop
ping %moonlight_ip% -n 1 >nul

for /f "tokens=6 delims=time=" %%G in ('ping %moonlight_ip% -n 1 ^| find "time="') do (
  set time=%%G
  
  if %time% GEQ %ping_threshold% (
    echo Ping: %time% ms
	rundll32 user32.dll,MessageBeep
  ) else (
    echo Ping: %time% ms
  )
)

timeout /t 1 >nul
goto loop
