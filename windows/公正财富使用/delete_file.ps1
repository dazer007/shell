#delete old tmp files,just save files in 15 days~
#windows ʹ��powershell ��ʱɾ�������ļ����߹�ʱ�����ļ�
$TimeOutDays=10    
$filePath="C:\soft\script\db_backup"     
$allFiles=get-childitem -path $filePath     
foreach ($files in $allFiles)     
{       
   $daypan=((get-date)-$files.lastwritetime).days       
   if ($daypan -gt $TimeOutDays)       
   {         
     remove-item $files.fullname -Recurse -force       
    }     
}