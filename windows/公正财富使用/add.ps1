ipmo PSScheduledJob 
$T = New-JobTrigger -Weekly -DaysOfWeek 0,1,2,3,4,5,6 -At 2:38AM
Register-ScheduledJob -Name Delete-Tmp-Files -FilePath "C:\soft\script\delete_file.ps1" -Trigger $T