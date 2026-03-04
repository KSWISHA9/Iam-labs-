param(
  [switch]$GitCommitAndPush
)

$projects = Get-ChildItem -Directory | Where-Object { $_.Name -match "^\d{2}-" }

foreach ($p in $projects) {

  $root = $p.FullName
  Write-Host "`nFixing $($p.Name)..." -ForegroundColor Cyan

  $screens = Join-Path $root "screenshots"

  if (!(Test-Path $screens)) {
      New-Item -ItemType Directory -Path $screens | Out-Null
  }

  # move docs files
  Move-Item "$root\docs\evidence.md" "$root\" -ErrorAction SilentlyContinue
  Move-Item "$root\docs\why-this-matters.md" "$root\" -ErrorAction SilentlyContinue
  Move-Item "$root\docs\architecture.md" "$root\" -ErrorAction SilentlyContinue
  Move-Item "$root\docs\README.md" "$root\" -ErrorAction SilentlyContinue

  # move screenshots
  if (Test-Path "$root\docs\screenshots") {
      Move-Item "$root\docs\screenshots\*" "$screens\" -ErrorAction SilentlyContinue
  }

  # move src docs
  Move-Item "$root\src\README.md" "$root\" -ErrorAction SilentlyContinue
  Move-Item "$root\src\architecture.md" "$root\" -ErrorAction SilentlyContinue

  # remove old folders
  Remove-Item "$root\docs" -Recurse -Force -ErrorAction SilentlyContinue
  Remove-Item "$root\src" -Recurse -Force -ErrorAction SilentlyContinue

  Write-Host "Cleaned $($p.Name)" -ForegroundColor Green
}

if ($GitCommitAndPush) {
    git add .
    git commit -m "Cleaned project structure"
    git push
}

Write-Host "`nAll projects cleaned." -ForegroundColor Green
