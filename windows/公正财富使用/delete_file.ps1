#delete old tmp files,just save files in 15 days~
#windows 使用powershell 定时删除日期文件或者过时备份文件
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