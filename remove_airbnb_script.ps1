$ErrorActionPreference = "Stop"

# Phase 1: Move contents of AirBnb to latticestay and remove AirBnb folder
$mainDir = "src\main\java\com\sahil\latticestay"
if (Test-Path "$mainDir\AirBnb") {
    Get-ChildItem -Path "$mainDir\AirBnb" | Move-Item -Destination $mainDir -Force
    Remove-Item -Path "$mainDir\AirBnb" -Force
    Write-Host "Moved main source files."
}

$testDir = "src\test\java\com\sahil\latticestay"
if (Test-Path "$testDir\AirBnb") {
    Get-ChildItem -Path "$testDir\AirBnb" | Move-Item -Destination $testDir -Force
    Remove-Item -Path "$testDir\AirBnb" -Force
    Write-Host "Moved test source files."
}

# Phase 2: Bulk replace com.sahil.latticestay.AirBnb -> com.sahil.latticestay
Get-ChildItem -Path . -Recurse -File | Where-Object { $_.Name -match '\.java$' } | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName)
    $newContent = $content -replace 'com\.sahil\.latticestay\.AirBnb', 'com.sahil.latticestay'
    if ($content -cne $newContent) {
        [System.IO.File]::WriteAllText($_.FullName, $newContent)
        Write-Host "Updated package in $($_.FullName)"
    }
}
Write-Host "Refactoring completed successfully."
