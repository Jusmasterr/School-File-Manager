$downloadsFolder = "C:\Users\justu\Downloads"
[string]$destFolder
$searchPatternLA = "LA*.docx"
$searchPatternPR = "PR*.pptx"


[bool]$run = $true
[string]$LogContent


function Log {
        param (
            [string]$LogFile = "sfmLog.txt"
        )
    
        $DateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $LogEntry = "$DateTime | $LogContent"
    
        Add-Content -Path $LogFile -Value $LogEntry
    }



$FilePath = "SfmLog.txt"
 
If (Test-Path -path $FilePath -PathType Leaf) 
{
    
} Else 
{    	
    New-Item -Path "sfmLog.txt" -ItemType File
    $LogContent = "Log-file created"
    Log
}





while ($run -eq $true) 
{
    $files = Get-ChildItem -Path $downloadsFolder -Filter $searchPatternPR
    if ($files.Count -gt 0) 
    {
        foreach ($file in $files) 
        {
            try {
                $croppedname = $file.Name -Replace 'PR_'
                $destFolder = $croppedname.Substring(0, 3)
                
                if (Test-Path -Path C:\Users\justu\Desktop\Schule\Informatik\$destFolder -PathType Container) 
                {
                    Move-Item -Path $file.FullName -Destination C:\Users\justu\Desktop\Schule\Informatik\$destFolder -Force
                    $LogContent = "$file moved to Directory: C:\Users\justu\Desktop\Schule\Informatik\$destFolder"
                    Log
                } else 
                {
                    New-Item -Path C:\Users\justu\Desktop\Schule\Informatik\$destFolder -ItemType Directory
                    Move-Item -Path $file.FullName -Destination C:\Users\justu\Desktop\Schule\Informatik\$destFolder -Force
                    $LogContent = "$file moved to new Directory: C:\Users\justu\Desktop\Schule\Informatik\$destFolder"
                    Log
                }   

            }
        catch { "" }

            
        }
    }
    else {
        #Write-Host "no file found"
    }


    $files = Get-ChildItem -Path $downloadsFolder -Filter $searchPatternLA
    if ($files.Count -gt 0) 
    {
        foreach ($file in $files) 
        {
            try {
                $croppedname = $file.Name -Replace 'LA_'
                $destFolder = $croppedname.Substring(0, 3)
                
                if (Test-Path -Path C:\Users\justu\Desktop\Schule\Informatik\$destFolder -PathType Container) 
                {
                    Move-Item -Path $file.FullName -Destination C:\Users\justu\Desktop\Schule\Informatik\$destFolder -Force
                    $LogContent = "$file moved to Directory: C:\Users\justu\Desktop\Schule\Informatik\$destFolder"
                    Log
                } else 
                {
                    New-Item -Path C:\Users\justu\Desktop\Schule\Informatik\$destFolder -ItemType Directory
                    Move-Item -Path $file.FullName -Destination C:\Users\justu\Desktop\Schule\Informatik\$destFolder -Force
                    $LogContent = "$file moved to new Directory: C:\Users\justu\Desktop\Schule\Informatik\$destFolder"
                    Log
                }
            }
        catch { "" }

            
        }
    }
    else {
        #Write-Host "no file found"
    }
}
