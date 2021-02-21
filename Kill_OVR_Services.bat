sc config OVRService start= demand
net start "OVRService"
if %errorlevel% == 2 net stop "OVRService"