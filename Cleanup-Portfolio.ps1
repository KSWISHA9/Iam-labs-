param(
  [switch]$GitCommitAndPush
)

$ErrorActionPreference = "Stop"

function Ensure-Dir($p) {
  if (!(Test-Path $p)) { New-Item -ItemType Directory -Path $p | Out-Null }
}

function Write-File($path, $content) {
  Set-Content -Path $path -Value $content -Encoding UTF8
}

Write-Host "=== Portfolio cleanup starting ===" -ForegroundColor Cyan

# 1) Remove .gitkeep (especially in 03 and 05, but we'll remove repo-wide)
$gitkeeps = Get-ChildItem -Path . -Recurse -Force -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq ".gitkeep" }
foreach ($f in $gitkeeps) {
  Remove-Item $f.FullName -Force -ErrorAction SilentlyContinue
}
Write-Host "Removed .gitkeep files (if any)." -ForegroundColor Green

# 2) Delete helper scripts from repo root if they exist
$toDelete = @("Flatten-IamLabs.ps1", "Update-LabReadmes.ps1")
foreach ($name in $toDelete) {
  if (Test-Path ".\$name") {
    Remove-Item ".\$name" -Force
    Write-Host "Deleted $name" -ForegroundColor Green
  } else {
    Write-Host "Not found (ok): $name" -ForegroundColor DarkGray
  }
}

# 3) Ensure each project has /screenshots folder at project root
$projects = @(
  "03-conditional-access-baseline",
  "04-sso-federation",
  "05-privileged-access-risk-dashboard"
)

foreach ($p in $projects) {
  Ensure-Dir ".\$p\screenshots"
}

# 4) Clean/standardize evidence.md files

# --- Project 04 evidence (SSO Federation) ---
$evidence04 = @"
# Evidence — SSO Federation (SAML)

This evidence validates SAML SSO configuration and successful authentication flow.

Screenshots folder:
screenshots/

---

## 01 — SAML Configuration (Entity ID / Reply URL / Claims)

**Screenshot here:** screenshots/sso-saml-configuration.png

What this shows:
- SAML SSO configured in the Enterprise Application
- Correct Identifier (Entity ID) and Reply URL
- Claims mapping is defined

Why it matters:
- Misconfigured Entity ID/Reply URL is one of the most common causes of SSO failures.

---

## 02 — Token Signing Certificate / Federation Metadata

**Screenshot here:** screenshots/sso-certificate-metadata.png

What this shows:
- Token signing certificate used to sign SAML assertions
- Federation metadata available for service provider onboarding

Why it matters:
- Certificates + metadata establish trust between IdP (Entra ID) and the Service Provider.

---

## 03 — Entra Sign-in Log Success

**Screenshot here:** screenshots/sso-signin-log-success.png

What this shows:
- Successful authentication event recorded in Entra sign-in logs
- Confirms IdP processed the authentication request

Why it matters:
- Sign-in logs are the primary source for troubleshooting SSO issues and proving control validation.

---

## 04 — Successful Federation Login to Service Provider

**Screenshot here:** screenshots/sso-federation-success.png

What this shows:
- Successful SSO login to the Service Provider via SAML federation

Why it matters:
- Confirms end-to-end federation flow works (IdP → assertion → SP → access granted).
"@

Write-File ".\04-sso-federation\evidence.md" $evidence04
Write-Host "Updated: 04-sso-federation\evidence.md" -ForegroundColor Green

# --- Project 03 evidence (Conditional Access + Identity Governance) ---
$evidence03 = @"
# Evidence — Conditional Access + Identity Governance

This evidence documents Conditional Access policy implementation and Identity Governance configuration (catalogs, access packages, access reviews).

Screenshots folder:
screenshots/

---

## Identity Governance

### 01 — Governance Catalog Created

**Screenshot here:** screenshots/identity-governance-catalog-created.png

What this shows:
- Catalog created to contain governed resources

Why it matters:
- Catalogs are foundational for governing which resources can be packaged, requested, and reviewed.

---

### 02 — Resource Registration to Catalog

**Screenshot here:** screenshots/identity-governance-resource-registration.png

What this shows:
- Security groups/resources registered to the governance catalog

Why it matters:
- Only registered resources can be exposed via access packages and governed through lifecycle workflows.

---

### 03 — Access Packages Created

**Screenshot here:** screenshots/identity-governance-access-packages.png

What this shows:
- Access packages created to represent role-based access bundles

Why it matters:
- Access packages enforce standardized access requests and prevent ad-hoc privilege assignment.

---

### 04 — Access Package Policy Configuration

**Screenshot here:** screenshots/identity-governance-policy-config.png

What this shows:
- Approval workflow / expiration / requestor settings configured

Why it matters:
- Policy controls reduce risk by enforcing approvals, time-bound access, and request restrictions.

---

### 05 — Access Review Created

**Screenshot here:** screenshots/identity-governance-access-review.png

What this shows:
- Periodic access review configured for high-risk access

Why it matters:
- Access reviews prevent privilege creep and support audit/compliance requirements.

---

### 06 — Access Review Confirmation / State

**Screenshot here:** screenshots/identity-governance-review-confirmation.png  
**Optional:** screenshots/identity-governance-catalog-state.png

What this shows:
- Review configuration confirmed / governance objects validated

Why it matters:
- Proves review and governance objects exist and are operational.

---

### 07 — Access Package Resource Roles

**Screenshot here:** screenshots/identity-governance-resource-roles.png

What this shows:
- Resource roles and assignments governed via access packages

Why it matters:
- Demonstrates controlled role provisioning through governance (not direct assignment).

---

## Conditional Access

### 08 — Conditional Access MFA Policy

**Screenshot here:** screenshots/conditional-access-mfa-policy.png

What this shows:
- CA policy requiring MFA (not just per-user MFA)

Why it matters:
- Conditional Access is the core control for enforcing Zero Trust conditions.

---

### 09 — Policy Created / Validation

**Screenshot here:** screenshots/conditional-access-policy-created.png

What this shows:
- Policy successfully created and ready for enforcement/validation

Why it matters:
- Provides implementation proof and supports auditability.
"@

Write-File ".\03-conditional-access-baseline\evidence.md" $evidence03
Write-Host "Updated: 03-conditional-access-baseline\evidence.md" -ForegroundColor Green

# --- Project 05 evidence (Risk Dashboard) ---
$evidence05 = @"
# Evidence — Privileged Access / Application Risk Dashboard (Microsoft Graph)

This evidence validates automated risk analysis of Entra application identities (service principals) using Microsoft Graph PowerShell.

Screenshots folder:
screenshots/

---

## 01 — Executive Summary Output

**Screenshot here:** screenshots/01-executive-summary.png

What this shows:
- Tenant-wide counts such as:
  - total service principals
  - apps with no owners
  - expired credentials
  - expiring credentials
  - no sign-in data / stale sign-ins

Why it matters:
- Provides a measurable risk snapshot and helps prioritize remediation.

---

## 02 — Top Risk Applications (Ranked)

**Screenshot here:** screenshots/02-top-risk-apps-table.png

What this shows:
- Top risky service principals ranked by risk score
- Risk drivers like:
  - OwnersCount
  - ExpiredCreds
  - ExpiringSoonCreds
  - LastSignIn

Why it matters:
- Translates raw configuration data into a prioritized remediation list.

---

## 03 — Risk Scoring Logic (Code Evidence)

**Screenshot here:** screenshots/03-risk-scoring-code.png

What this shows:
- Microsoft Graph queries + scoring logic used to compute risk
- How ownership, credential lifecycle, and sign-in activity influence the score

Why it matters:
- Demonstrates repeatable, auditable engineering logic (not manual portal clicking).
"@

Write-File ".\05-privileged-access-risk-dashboard\evidence.md" $evidence05
Write-Host "Updated: 05-privileged-access-risk-dashboard\evidence.md" -ForegroundColor Green

Write-Host "=== Cleanup done ===" -ForegroundColor Cyan

if ($GitCommitAndPush) {
  git add -A
  git commit -m "Cleanup: remove gitkeep/scripts and standardize evidence for 03-05"
  git push
  Write-Host "✅ Committed and pushed." -ForegroundColor Green
} else {
  Write-Host "ℹ️ Not pushed. Run again with -GitCommitAndPush when ready." -ForegroundColor Yellow
}
