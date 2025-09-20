
$ErrorActionPreference = 'Stop'

$packageName = 'mozjpeg'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$unzipLocation = Join-Path "$toolsDir" "$packageName"

Install-ChocolateyZipPackage `
    -PackageName "$packageName" `
    -UnzipLocation "$unzipLocation" `
    -Url64bit "https://github.com/garyzyg/mozjpeg-windows/releases/download/4.1.5/mozjpeg-x64.zip" `
    -Checksum64 "176ef4f632b09dca449e27bc11df090c1222528dff9f583a14bbd026a0c8eb2f" `
    -ChecksumType64 'sha256' `
    -Url "https://github.com/garyzyg/mozjpeg-windows/releases/download/4.1.5/mozjpeg-x86.zip" `
    -Checksum "ef5c30b892b48e1c4bf82752ecbea1280e03d285ede8f1d3d47cb939f4ca150a" `
    -ChecksumType 'sha256'    

Get-ChildItem -Path "$unzipLocation\*" | ForEach-Object {
    Move-Item -Path "$($_.FullName)" -Destination "$toolsDir\$($_.Name.Replace('-static',''))"
}