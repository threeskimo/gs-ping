@echo off

IF NOT "%1"=="" (
	set moonlight_ip=%1
) else (
	set moonlight_ip=192.168.1.137
)

IF NOT "%2"=="" (
	set ping_threshold=%2
) else (
	set ping_threshold=25
)

::CHANGE THESE :::::::::::::::::::::::::::::::::::
:: set moonlight_ip=192.168.1.137
:: set ping_threshold=25
:::::::::::::::::::::::::::::::::::::::::::::::::::

echo Pinging %moonlight_ip% with threshold: %ping_threshold%

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