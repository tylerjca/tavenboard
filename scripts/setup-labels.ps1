# Creates or updates TavenBoard's GitHub labels. Safe to run again.
$labels = @(
  @{ n = "type:story";        c = "0E8A16"; d = "User story with acceptance criteria" },
  @{ n = "type:bug";          c = "D73A4A"; d = "Fails a criterion or surprises you" },
  @{ n = "type:task";         c = "BFBFBF"; d = "Setup or chore, no user-visible change" },
  @{ n = "type:test";         c = "8250DF"; d = "Test case or automation work" },
  @{ n = "epic:E1-session";   c = "1D76DB"; d = "Unique URL, join, real-time sync, reconnect" },
  @{ n = "epic:E2-identity";  c = "1D76DB"; d = "Name, emoji, rejoin, presence" },
  @{ n = "epic:E3-tasks";     c = "1D76DB"; d = "Create, move, close, archive, undo" },
  @{ n = "epic:E4-lifecycle"; c = "1D76DB"; d = "Auto-delete, warning, export/import, owner link" },
  @{ n = "epic:E5-scoreboard";c = "1D76DB"; d = "Stats and anti-farming rules" },
  @{ n = "epic:E6-recurring"; c = "1D76DB"; d = "Repeat timers" },
  @{ n = "epic:E7-themes";    c = "1D76DB"; d = "Colour palettes" },
  @{ n = "epic:E8-launch";    c = "1D76DB"; d = "Donate link, privacy page, domain" },
  @{ n = "epic:E9-permanence";c = "1D76DB"; d = "Paid keep-forever (post-MVP)" },
  @{ n = "mvp";               c = "FBCA04"; d = "In MVP scope" },
  @{ n = "later";             c = "FFFFFF"; d = "After MVP" },
  @{ n = "P1";                c = "D93F0B"; d = "Priority 1 (highest)" },
  @{ n = "P2";                c = "F9A03F"; d = "Priority 2" },
  @{ n = "P3";                c = "FEF2C0"; d = "Priority 3" },
  @{ n = "sev:1";             c = "B60205"; d = "Data loss or board unusable" },
  @{ n = "sev:2";             c = "E4606D"; d = "Core flow broken" },
  @{ n = "sev:3";             c = "F4A3AB"; d = "Workaround exists" },
  @{ n = "sev:4";             c = "FBDADD"; d = "Cosmetic" },
  @{ n = "abuse";             c = "000000"; d = "Abuse or security case" }
)
foreach ($l in $labels) {
  gh label create $l.n --color $l.c --description $l.d --force
  if ($LASTEXITCODE -ne 0) { Write-Host "FAILED: $($l.n)" -ForegroundColor Red }
}
Write-Host "Done. Labels processed: $($labels.Count)" -ForegroundColor Green