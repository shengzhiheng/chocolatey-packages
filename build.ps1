# build.ps1
$PackageName = "rescuetime"
$InstallerUrl = "https://www.rescuetime.com/installers/RescueTimeInstaller_X.exe"
$TempFile = "$env:TEMP\RescueTimeInstaller.exe"

# Step 1: Download installer
Write-Host "Downloading $InstallerUrl..."
Invoke-WebRequest -Uri $InstallerUrl -OutFile $TempFile

# Step 2: Get version and checksum
$id = "rescuetime"
$title = ([System.Diagnostics.FileVersionInfo]::GetVersionInfo($TempFile).ProductName).Trim()
$version = ([System.Diagnostics.FileVersionInfo]::GetVersionInfo($TempFile).FileVersion).Trim()
$author = ([System.Diagnostics.FileVersionInfo]::GetVersionInfo($TempFile).CompanyName).Trim()
$copyright = ([System.Diagnostics.FileVersionInfo]::GetVersionInfo($TempFile).LegalCopyright).Trim()
$checksum = (Get-FileHash $TempFile -Algorithm SHA256).Hash

# Step 3: Generate chocolateyinstall.ps1 and uninstall.ps1 from template
$templatePath = "./src/tools/chocolateyinstall.ps1.tmpl"
$installScript = "./src/tools/chocolateyinstall.ps1"

(Get-Content $templatePath) `
  -replace "{{url}}", $InstallerUrl `
  -replace "{{checksum}}", $checksum `
  | Set-Content $installScript

$uninstallTemplate = "./src/tools/chocolateyuninstall.ps1.tmpl"
$uninstallScript = "./src/tools/chocolateyuninstall.ps1"

(Get-Content $uninstallTemplate) `
  | Set-Content $uninstallScript

# Step 4: Generate .nuspec from template
$nuspecTemplate = "./src/rescuetime.nuspec.tmpl"
$nuspecFile = "./src/rescuetime.nuspec"
$nuspecContent = Get-Content $nuspecTemplate -Raw
$nuspecContent = $nuspecContent `
  -replace "{{id}}", $id `
  -replace "{{title}}", $title `
  -replace "{{version}}", $version `
  -replace "{{author}}", $author `
  -replace "{{copyright}}", $copyright `
  | Set-Content $nuspecFile

# Step 5: Build package
Push-Location ./src
choco pack
Pop-Location

Write-Host "Package built: ./src/$PackageName.$version.nupkg"