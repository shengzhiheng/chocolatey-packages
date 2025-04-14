# build.ps1
$PackageName = "feishin"
$Author = "jeffvli"
$ApiUrl = "https://api.github.com/repos/$Author/$PackageName/releases/latest"
$Headers = @{"User-Agent" = "PowerShell"}
try {
    $Response = Invoke-RestMethod -Uri $ApiUrl -Headers $Headers
    # The tag_name typically holds the release version/tag
    $Version = $Response.tag_name -replace '^v',''
} catch {
    Write-Host "Failed to get latest release: $($_.Exception.Message)"
}
$InstallerUrl = "https://github.com/jeffvli/feishin/releases/download/v$Version/Feishin-$Version-win-x64.exe"
$TempFile = "$env:TEMP\FeishinInstaller.exe"

# Step 1: Download installer
Write-Host "Downloading $InstallerUrl..."
Invoke-WebRequest -Uri $InstallerUrl -OutFile $TempFile

# Step 2: Get checksum
$Title = ([System.Diagnostics.FileVersionInfo]::GetVersionInfo($TempFile).ProductName).Trim()
$Copyright = ([System.Diagnostics.FileVersionInfo]::GetVersionInfo($TempFile).LegalCopyright).Trim()
$Checksum = (Get-FileHash $TempFile -Algorithm SHA256).Hash

# Step 3: Generate chocolateyinstall.ps1 and uninstall.ps1 from template
$templatePath = "./chocolateyinstall.ps1.tmpl"
$installScript = "./chocolateyinstall.ps1"

(Get-Content $templatePath) `
  -replace "{{Url}}", $InstallerUrl `
  -replace "{{Checksum}}", $Checksum `
  | Set-Content $installScript

$uninstallTemplate = "./chocolateyuninstall.ps1.tmpl"
$uninstallScript = "./chocolateyuninstall.ps1"

(Get-Content $uninstallTemplate) `
  -replace "{{Title}}", $Title `
  | Set-Content $uninstallScript

# Step 4: Generate .nuspec from template
$nuspecTemplate = "./feishin.nuspec.tmpl"
$nuspecFile = "./feishin.nuspec"
$nuspecContent = Get-Content $nuspecTemplate -Raw
$nuspecContent = $nuspecContent `
  -replace "{{PackageName}}", $PackageName `
  -replace "{{Title}}", $Title `
  -replace "{{Version}}", $Version `
  -replace "{{Author}}", $Author `
  -replace "{{Copyright}}", $Copyright `
  | Set-Content $nuspecFile

# Step 5: Build package
Push-Location ./
choco pack
Pop-Location

Write-Host "Package built: ./$PackageName.$version.nupkg"