``` powershell
function My-Function {
    param (
        [string]$inputFile
    )
    Write-Output "Hello world, at file: $inputFile"

    # fail if command not found
    if (!(Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
        Write-Error "ffmpeg is not installed or not in PATH"
        exit 1 # exit with err code
    }
    ffmpeg -i myfile.webp myfile.webp # run commands
}

# iter over files in folder, files are piped to ForEach-Object iterator
Get-ChildItem -Path "MyFolder" -Filter "*.webp" -File | ForEach-Object {
    # $_ refers to current file being processed by the for loop
    My-Function -inputFile $_.FullName
    Write-Error "Error at file $_"
}
# replace .webp/.webp with .webp and pipe changed content
# to Set-Content <path> to replace content there
(Get-Content $_.FullName) `
    -replace '\.(?:png|jpg|jpeg)', '.webp' `
    -replace '\.(?:PNG|JPG|JPEG)', '.webp' ` |
Set-Content $_.FullName
```
### Count File Extensions
``` powershell
powershell -command "Get-ChildItem -Recurse -File | Group-Object Extension | Sort-Object Count -Descending"
```
