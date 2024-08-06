# Place this file in your vault's root directory

# This script
# - converts images to webp
# - shortens links

# Check if ffmpeg is installed
if (!(Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    Write-Error "ffmpeg is not installed or not in PATH"
    exit 1
}

function Convert-Images {
    param (
        [string]$Extension
    )
    
    Get-ChildItem -Path Attachments -Filter "*.$Extension" -File | ForEach-Object {
        $inputFile = $_.FullName
        $outputFile = "Attachments\$($_.BaseName).webp"
        try {
            ffmpeg -nostats -hide_banner -v error -i $inputFile -y $outputFile
            if (Test-Path $outputFile) {
                Remove-Item $inputFile -Force
                Write-Output "Deleted $($_.BaseName) after successful conversion"
            } else {
                Write-Warning "Conversion failed for $inputFile. Original file not deleted"
            }
        } catch {
            Write-Error "Error converting $inputFile : $_"
        }
    }
}

Convert-Images -Extension "png"
Convert-Images -Extension "jpg"
Convert-Images -Extension "jpeg"

# In all .md notes
# - replace .png, .jpg, .jpeg with .webp 
# - shorten links
#   - replace youtube.com/watch?v= with youtu.be/
#   - remove https:// and www.
Get-ChildItem -Recurse -Filter *.md | ForEach-Object {
    (Get-Content $_.FullName) `
        -replace '\.(?:png|jpg|jpeg)', '.webp' `
        -replace '\.(?:PNG|JPG|JPEG)', '.webp' `
        -replace 'youtube\.com/watch\?v=', 'youtu.be/' `
        -replace 'https?://(www\.)?', '' |
    Set-Content $_.FullName
}