get-content -path C:\Users\Mugilan\Desktop\computers.txt | 
  Where {$_ -AND (Test-Connection $_ -Quiet)} |
    foreach { Get-Hotfix -computername $_ -Credential (Get-Credential -Credential Administrator ) } | 
      Select CSName,Description,HotFixID,InstalledBy,InstalledOn |
        convertto-csv | out-file "C:\test.csv"