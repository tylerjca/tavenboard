# Creates TavenBoard's milestones. Safe to run again: skips ones that exist.
$milestones = @(
  @{ t = "M0 Setup";                 d = "Tools, repo, tracking, hello page live, CI smoke test" },
  @{ t = "M1 Session foundation";    d = "Unique URL, join, real-time sync, reconnect, invalid/expired IDs (E1)" },
  @{ t = "M2 Identity";              d = "Name + emoji, uniqueness, rejoin, presence (E2)" },
  @{ t = "M3 Tasks";                 d = "Create, move, close, archive, edit, undo (E3)" },
  @{ t = "M4 Lifecycle + data";      d = "Auto-delete, expiry warning, export/import, owner link (E4)" },
  @{ t = "M5 Scoreboard + themes";   d = "Stats, anti-farming rules, palettes (E5, E7)" },
  @{ t = "M6 Recurring + hardening"; d = "Repeat timers, abuse limits, friends beta (E6)" },
  @{ t = "M7 Launch";                d = "Donate link, privacy page, custom domain (E8)" },
  @{ t = "M8 Paid permanence";       d = "Post-MVP: keep-forever option (E9)" }
)
$existing = gh api 'repos/{owner}/{repo}/milestones?state=all' --jq '.[].title'
foreach ($m in $milestones) {
  if ($existing -contains $m.t) { Write-Host "Exists:  $($m.t)"; continue }
  gh api 'repos/{owner}/{repo}/milestones' -f "title=$($m.t)" -f "description=$($m.d)" --silent
  if ($LASTEXITCODE -ne 0) { Write-Host "FAILED:  $($m.t)" -ForegroundColor Red }
  else { Write-Host "Created: $($m.t)" -ForegroundColor Green }
}
