
@ECHO off

	::------------------------------------------::
	::| Autocharger Script for Windows by Drey |::
	::------------------------------------------::

	:vars
		:: Variable that indicates the minimum value of the battery in which the charger is going to be connected
			set /a min = 34
		:: Variable that indicates the maximum battery value up to which the charger will charge
			set /a max = 74
			
			
	:battery
		:: Save pc battery level to a temp file
			WMIC PATH Win32_Battery Get EstimatedChargeRemaining > battery.txt
				for /f %%x in ('dir /b battery*.*') do call :parse "%%x"
	:parse
		:: Isolate battery level from temp file and save it to another temp file
			for /f "skip=1 tokens=*" %%a in ('type %~1') do echo %%a>>temp.txt
				Copy /y temp.txt "%1" > tempCopy.txt
	:echo
		:: Read the temp file and save the battery level in a variable
			set /p batText =< temp.txt
			set /a battery = %batText%
	:check
		:: Check if the battery level in the variable is less than or equal to the minimum, or greater than or equal to the maximum
				if %battery% LEQ %min% goto:charge
				if %battery% GEQ %max% goto:discharge
			goto :deleteTemp
	:discharge
		:: If the battery level is greater than or equal to the maximum, send the wifi plug through IFTTT Webhooks to turn off
				curl https://maker.ifttt.com/trigger/offChargerPersonal/json/with/key/{Key of IFTTT Webhooks}
			goto :deleteTemp
	:charge
		:: If the battery level is less than or equal to the minimum, send the Wi-Fi plug through IFTTT Webhooks to turn on
				curl https://maker.ifttt.com/trigger/onChargerPersonal/json/with/key/{Key of IFTTT Webhooks}
			goto :deleteTemp
	:deleteTemp
		:: Delete temp files
			if exist temp.txt del /q temp.txt
			if exist tempCopy.txt del /q tempCopy.txt
			if exist battery.txt del /q battery.txt
			
EXIT
