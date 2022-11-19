$computers = Get-Content -Path "<INSERT-PATH-TO-CSV>"
$ToBeCleaned = @()

# Do these computers have the file CLEANUP_COMPLETE ????
# If Yes, then add to an array ToBeCleaned
foreach ($computer in $computers) {
  Write-Host ("Checking::"+$computer)
  $result = Test-Path ("\\"+$computer+"\c$\<PATH-TO-FILE")
  if ($result -eq $true) {
    $ToBeCleaned += $computer
  }
  Write-Host $ToBeCleaned.Count
}

# Delete that file CLEANUP_COMPLETE from the array ToBeCleaned
foreach ($computer in $ToBeCleaned) {
  Remove-Item -Path ("\\"+$computer+"\c$\<PATH-TO-FILE") -Force
}
