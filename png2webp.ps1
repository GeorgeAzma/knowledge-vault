# Place this file in your vault's root directory

# This script
# - converts images to webp
# - shortens links
# - compresses svg files (optional)

# if (!(Get-Command svgo -ErrorAction SilentlyContinue)) {
#     Write-Warning "SVGO is not installed or not in PATH, try 'npm i -g svgo'"
# }

# Check if ffmpeg is installed
if (!(Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    Write-Warning "ffmpeg is not installed or not in PATH"
} else {
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
                Write-Warning "Error converting $inputFile : $_"
            }
        }
    }

    Convert-Images -Extension "png"
    Convert-Images -Extension "jpg"
    Convert-Images -Extension "jpeg"
}

# In all .md notes
# - replace .png, .jpg, .jpeg with .webp 
# - shorten links
#   - replace youtube.com/watch?v= with youtu.be/
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
Get-ChildItem -Recurse -Filter *.md | ForEach-Object {
    $filePath = $_.FullName
    $originalContent = [System.IO.File]::ReadAllText($filePath)
    
    $newContent = $originalContent `
        -replace '\.(?:png|jpg|jpeg)', '.webp' `
        -replace '\.(?:PNG|JPG|JPEG)', '.webp' `
        -replace 'youtube\.com/watch\?v=', 'youtu.be/'
    
    if ($originalContent -ne $newContent) {
        [System.IO.File]::WriteAllText($filePath, $newContent, $utf8NoBom)
        Write-Output "Updated: $($_.Name)"
    }
}

# Compress .svg
# Get-ChildItem -Path Attachments -Filter *.svg -File | ForEach-Object {
#     try {
#         npm i -g svgo
#         svgo $_.FullName -o $_.FullName
#     } catch {
#         Write-Warning "Error compressing SVG file $inputFile : $_"
#     }
# }