# PowerShell script to move all contents from 'open-webui-fork' to the current directory and delete the subfolder

$source = Join-Path $PSScriptRoot 'open-webui-fork'
$destination = $PSScriptRoot

Write-Host "Moving all contents from '$source' to '$destination'..."

# Move all files and folders, including hidden ones
Get-ChildItem -Path $source -Force | ForEach-Object {
    $target = Join-Path $destination $_.Name
    if (Test-Path $target) {
        Write-Host "Skipping existing: $($_.Name)"
    } else {
        Move-Item -Path $_.FullName -Destination $destination -Force
        Write-Host "Moved: $($_.Name)"
    }
}

# Check if the folder is now empty
if ((Get-ChildItem -Path $source -Force | Measure-Object).Count -eq 0) {
    Write-Host "Deleting empty folder: $source"
    Remove-Item -Path $source -Force -Recurse
} else {
    Write-Host "Some items could not be moved. Please check '$source' manually."
}

Write-Host "Done. All contents should now be in the root directory." 