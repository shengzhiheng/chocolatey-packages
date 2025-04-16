# build.ps1
$PackageName = "quantum"
$Author = "UHAXM1"
$ApiUrl = "https://api.github.com/repos/$Author/$PackageName/releases/latest"
$Headers = @{"User-Agent" = "PowerShell"}
try {
    $Response = Invoke-RestMethod -Uri $ApiUrl -Headers $Headers
    # The tag_name typically holds the release version/tag
    $Version = $Response.tag_name -replace '^v',''
} catch {
    Write-Host "Failed to get latest release: $($_.Exception.Message)"
}
$InstallerUrl = "https://github.com/$Author/$PackageName/releases/download/v${Version}/Quantum_Setup.exe"
$TempFile = "$env:TEMP\QuantumInstaller.exe"

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
  | Set-Content $uninstallScript

# Step 4: Generate .nuspec from template
$nuspecTemplate = "./quantum.nuspec.tmpl"
$nuspecFile = "./quantum.nuspec"
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

Write-Host "Package built: ./$PackageName.$Version.nupkg"