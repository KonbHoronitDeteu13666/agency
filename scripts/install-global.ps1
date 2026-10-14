# Installs the agency agents and skills for the whole user account, so they exist in any folder.
# Source of truth stays in the agency repo. Run this again after ANY change to .claude\agents or .claude\skills.
# Global agent copies get one extra line saying that relative paths belong to the agency folder.
$ErrorActionPreference = 'Stop'

$agencyHome = 'C:\Users\HP\Desktop\agency'
$userClaude = Join-Path $env:USERPROFILE '.claude'
$agentsSrc  = Join-Path $agencyHome '.claude\agents'
$agentsDst  = Join-Path $userClaude 'agents'
$skillsSrc  = Join-Path $agencyHome '.claude\skills'
$skillsDst  = Join-Path $userClaude 'skills'

$anchor = 'AGENCY_HOME = ' + $agencyHome + '. Shared things live in AGENCY_HOME and are always read there by absolute path: departments/, docs/, design-library/, leads/, clients/, marketing/, templates/, .claude/skills/. The project itself lives in PROJECT_DIR, which the main agent gives you in your prompt: wherever these instructions say projects/<slug>/ they mean PROJECT_DIR (the files 01-brief.md, 02-tz.md, 03-design/, 04-build/ and so on sit directly in PROJECT_DIR), and brandbooks/<client>/ means PROJECT_DIR\brandbook\. If your prompt gives no PROJECT_DIR, stop and ask the main agent; never guess, and never write project files in the current folder or in AGENCY_HOME unless told to. Always use absolute paths.'
$enc = New-Object System.Text.UTF8Encoding($false)

New-Item -ItemType Directory -Force -Path $agentsDst | Out-Null
$count = 0
foreach ($f in Get-ChildItem -Path $agentsSrc -Filter '*.md') {
    $lines = [System.IO.File]::ReadAllLines($f.FullName, [System.Text.Encoding]::UTF8)
    $end = -1
    for ($i = 1; $i -lt $lines.Count; $i++) {
        if ($lines[$i].TrimEnd() -eq '---') { $end = $i; break }
    }
    if ($lines.Count -lt 3 -or $lines[0].TrimEnd() -ne '---' -or $end -lt 0) {
        Write-Warning ('Skipped (no frontmatter): ' + $f.Name)
        continue
    }
    $out = New-Object System.Collections.Generic.List[string]
    for ($i = 0; $i -le $end; $i++) { $out.Add($lines[$i]) }
    $out.Add('')
    $out.Add($anchor)
    for ($i = $end + 1; $i -lt $lines.Count; $i++) { $out.Add($lines[$i]) }
    [System.IO.File]::WriteAllLines((Join-Path $agentsDst $f.Name), $out, $enc)
    $count++
}
Write-Host ('Agents installed: ' + $count + ' -> ' + $agentsDst)

if (Test-Path $skillsSrc) {
    New-Item -ItemType Directory -Force -Path $skillsDst | Out-Null
    $skillCount = 0
    foreach ($d in Get-ChildItem -Path $skillsSrc -Directory) {
        $target = Join-Path $skillsDst $d.Name
        New-Item -ItemType Directory -Force -Path $target | Out-Null
        Copy-Item -Path (Join-Path $d.FullName '*') -Destination $target -Recurse -Force
        $skillCount++
    }
    Write-Host ('Skills installed: ' + $skillCount + ' -> ' + $skillsDst)
}
Write-Host 'Done. Open a NEW session for the changes to be picked up.'
