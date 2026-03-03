$ErrorActionPreference = "Stop"

# Phase 1: Rename main folders
Rename-Item -Path "src\main\java\com\aman" -NewName "sahil"
Rename-Item -Path "src\main\java\com\sahil\AirBnb" -NewName "latticestay"

# Rename test folders
Rename-Item -Path "src\test\java\com\aman" -NewName "sahil"
Rename-Item -Path "src\test\java\com\sahil\AirBnb" -NewName "latticestay"

# Phase 2: Bulk replace com.aman.AirBnb -> com.sahil.latticestay
Get-ChildItem -Path . -Recurse -File | Where-Object { $_.Name -match '\.java$' -or $_.Name -eq 'pom.xml' } | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName)
    $newContent = $content -replace 'com\.aman\.AirBnb', 'com.sahil.latticestay'
    if ($content -cne $newContent) {
        [System.IO.File]::WriteAllText($_.FullName, $newContent)
        Write-Host "Updated $($_.FullName)"
    }
}

# Phase 3: Rename main class file and contents
$mainDir = "src\main\java\com\sahil\latticestay\AirBnb"
if (Test-Path "$mainDir\AirBnbApplication.java") {
    Rename-Item -Path "$mainDir\AirBnbApplication.java" -NewName "LatticeStayApplication.java"
    $mainFile = "$mainDir\LatticeStayApplication.java"
    $content = [System.IO.File]::ReadAllText($mainFile)
    $newContent = $content -replace 'AirBnbApplication', 'LatticeStayApplication'
    [System.IO.File]::WriteAllText($mainFile, $newContent)
    Write-Host "Renamed main class file and updated string 'AirBnbApplication' inside."
} else {
    Write-Host "Main class file not found at $mainDir\AirBnbApplication.java"
}

# Phase 3 extension: test class file
$testDir = "src\test\java\com\sahil\latticestay\AirBnb"
if (Test-Path "$testDir\AirBnbApplicationTests.java") {
    Rename-Item -Path "$testDir\AirBnbApplicationTests.java" -NewName "LatticeStayApplicationTests.java"
    $testFile = "$testDir\LatticeStayApplicationTests.java"
    $content = [System.IO.File]::ReadAllText($testFile)
    $newContent = $content -replace 'AirBnbApplicationTests', 'LatticeStayApplicationTests'
    $newContent = $newContent -replace 'AirBnbApplication', 'LatticeStayApplication'
    [System.IO.File]::WriteAllText($testFile, $newContent)
    Write-Host "Renamed test class file and updated string inside."
} else {
    Write-Host "Test class file not found at $testDir\AirBnbApplicationTests.java"
}

Write-Host "Refactoring completed successfully."
