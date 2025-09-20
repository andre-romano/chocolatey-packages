
$ErrorActionPreference = 'Stop'

$packageName = 'gifsicle'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$unzipLocation = Join-Path "$toolsDir" "$packageName"

Install-ChocolateyZipPackage `
    -PackageName "$packageName" `
    -UnzipLocation "$unzipLocation" `
    -Url64bit "https://eternallybored.org/misc/gifsicle/releases/gifsicle-1.95-win64.zip" `
    -Checksum64 "7e47dd0bfd5ee47f911464c57faeed89a8709a7625dd1c449b16579889539ee8" `
    -ChecksumType64 'sha256' `
    -Url "https://eternallybored.org/misc/gifsicle/releases/gifsicle-1.95-win32.zip" `
    -Checksum "f31464e334b9fb83d4dc60a25bde7cfa35829564bc378c40f0d3c6350910256c" `
    -ChecksumType 'sha256'    

Get-ChildItem -Path "$unzipLocation\*" | ForEach-Object {
    Move-Item -Path "$($_.FullName)" -Destination "$toolsDir\$($_.Name)"
}