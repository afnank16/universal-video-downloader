
param(
    [Parameter(Mandatory = $true)]
    [string]$ResultFile
)

$ErrorActionPreference = "Stop"

$options = @(
    [PSCustomObject]@{
        Name   = "360p"
        Format = "bv*[height<=360]+ba/b[height<=360]"
    },
    [PSCustomObject]@{
        Name   = "480p"
        Format = "bv*[height<=480]+ba/b[height<=480]"
    },
    [PSCustomObject]@{
        Name   = "720p"
        Format = "bv*[height<=720]+ba/b[height<=720]"
    },
    [PSCustomObject]@{
        Name   = "1080p"
        Format = "bv*[height<=1080]+ba/b[height<=1080]"
    },
    [PSCustomObject]@{
        Name   = "Best overall"
        Format = "bv*+ba/b"
    }
)

$selected = 2
$startRow = [Console]::CursorTop
$menuTop = $startRow + 2

try {
    [Console]::CursorVisible = $false

    Write-Host ""
    Write-Host "Use UP/DOWN arrows to choose quality, then press ENTER." -ForegroundColor Cyan
    Write-Host ""

    function Draw-Menu {
        for ($i = 0; $i -lt $options.Count; $i++) {
            [Console]::SetCursorPosition(0, $menuTop + $i)

            if ($i -eq $selected) {
                Write-Host ("  > {0}                  " -f $options[$i].Name) `
                    -ForegroundColor Black -BackgroundColor Cyan
            }
            else {
                Write-Host ("    {0}                  " -f $options[$i].Name) `
                    -ForegroundColor Gray -BackgroundColor Black
            }
        }
    }

    Draw-Menu

    while ($true) {
        $key = [Console]::ReadKey($true)

        switch ($key.Key) {
            "UpArrow" {
                $selected = ($selected - 1 + $options.Count) % $options.Count
                Draw-Menu
            }
            "DownArrow" {
                $selected = ($selected + 1) % $options.Count
                Draw-Menu
            }
            "Enter" {
                break
            }
            "Escape" {
                throw "Selection cancelled."
            }
        }

        if ($key.Key -eq "Enter") {
            break
        }
    }

    [Console]::SetCursorPosition(0, $menuTop + $options.Count + 1)
    [Console]::CursorVisible = $true

    Write-Host "Selected: $($options[$selected].Name)" -ForegroundColor Green

    Set-Content -LiteralPath $ResultFile -Value $options[$selected].Format -Encoding ASCII
    exit 0
}
catch {
    [Console]::CursorVisible = $true
    Write-Host ""
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}
finally {
    [Console]::CursorVisible = $true
}
