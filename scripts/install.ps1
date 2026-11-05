param(
    [Parameter(Mandatory = $true)]
    [string]$InstancePath,

    [ValidateSet("tecnologico-rapido")]
    [string]$Preset = "tecnologico-rapido"
)

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot
$overrideDir = Join-Path $repo "config-overrides\$Preset"
$replacementFile = Join-Path $repo "config\easy-mode.replacements.tsv"
$backupRoot = Join-Path $InstancePath ".gtnh-easy-mode-backups"
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupDir = Join-Path $backupRoot $stamp

if (-not (Test-Path -LiteralPath $InstancePath -PathType Container)) {
    throw "The GTNH instance directory does not exist: $InstancePath"
}

if (-not (Test-Path -LiteralPath $replacementFile -PathType Leaf)) {
    throw "Replacement table missing: $replacementFile"
}

New-Item -ItemType Directory -Force -Path $backupDir | Out-Null

function Backup-File {
    param([Parameter(Mandatory = $true)][string]$File)

    if (-not (Test-Path -LiteralPath $File -PathType Leaf)) {
        return
    }

    $instanceRoot = $InstancePath.TrimEnd('\', '/')
    $relative = $File.Substring($instanceRoot.Length).TrimStart('\', '/')
    $target = Join-Path $backupDir $relative
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
    Copy-Item -LiteralPath $File -Destination $target -Force
}

function Set-ConfigKey {
    param(
        [Parameter(Mandatory = $true)][string]$File,
        [Parameter(Mandatory = $true)][string]$Key,
        [Parameter(Mandatory = $true)][string]$Old,
        [Parameter(Mandatory = $true)][string]$New
    )

    if (-not (Test-Path -LiteralPath $File -PathType Leaf)) {
        Write-Warning "File missing; skipped: $File"
        return $false
    }

    $escaped = [regex]::Escape($Key)
    $lines = [System.IO.File]::ReadAllLines($File)
    $found = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^(\s*)${escaped}\s*=.*$") {
            $indent = $Matches[1]
            $lines[$i] = "${indent}${Key}=${New}"
            $found = $true
            break
        }
    }

    if (-not $found) {
        Write-Warning "Key missing; skipped: $Key in $File"
        return $false
    }

    [System.IO.File]::WriteAllLines($File, $lines, [System.Text.UTF8Encoding]::new($false))
    return $true
}

$applied = 0
$skipped = 0

foreach ($row in (Import-Csv -LiteralPath $replacementFile -Delimiter "`t")) {
    $file = Join-Path $InstancePath $row.path
    Backup-File -File $file

    if (Set-ConfigKey -File $file -Key $row.key -Old $row.old -New $row.new) {
        $applied++
    } else {
        $skipped++
    }
}

$gendustryFiles = @(
    "config\gendustry\overrides\tuning.cfg",
    "config\gendustry\overrides\upgrades.cfg"
)

foreach ($relative in $gendustryFiles) {
    $source = Join-Path $repo $relative
    $target = Join-Path $InstancePath $relative

    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
        Write-Warning "Override missing; skipped: $source"
        continue
    }

    Backup-File -File $target
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
    Copy-Item -LiteralPath $source -Destination $target -Force
}

$scriptFiles = @(
    "easymode_ae2_lv.zs",
    "easymode_magic.zs"
)

$instanceScripts = Join-Path $InstancePath "scripts"
New-Item -ItemType Directory -Force -Path $instanceScripts | Out-Null

foreach ($scriptName in $scriptFiles) {
    $source = Join-Path $repo "scripts\$scriptName"
    $target = Join-Path $instanceScripts $scriptName
    if (Test-Path -LiteralPath $source -PathType Leaf) {
        Backup-File -File $target
        Copy-Item -LiteralPath $source -Destination $target -Force
    }
}

Write-Host ""
Write-Host "GTNH Easy Mode: preset '$Preset'"
Write-Host "Applied config replacements: $applied"
Write-Host "Skipped or missing: $skipped"
Write-Host "Backup: $backupDir"
Write-Host ""
Write-Host "External mods to install manually:"
Write-Host "  EZMiner: https://github.com/czqwq/EZMiner"
Write-Host "  EZGT:    https://github.com/KingofKeet/EZGT"
Write-Host "  Visual Prospecting: https://github.com/GTNewHorizons/VisualProspecting"
Write-Host ""
Write-Host "Create a new world and test EZGT/easy mode changes. The script does not download jars."
