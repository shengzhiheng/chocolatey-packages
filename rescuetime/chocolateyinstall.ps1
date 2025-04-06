$ErrorActionPreference = "Stop";

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType = "exe"
  silentArgs = "/VERYSILENT /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  url = "https://www.rescuetime.com/installers/RescueTimeInstaller_X.exe"
  checksum = "C2E00203A28A46D9CE53DE0F0EAF86CA91F385E328880BAE3242FAD474C424FA"
  checksumType = "sha256"
};

Install-ChocolateyPackage @packageArgs

$installLocation = Get-AppInstallLocation "rescuetime*"
if ($installLocation) {
  Write-Host "$packageName installed to '$installLocation'"
} else {
  Write-Warning "Can't find install location"
}
