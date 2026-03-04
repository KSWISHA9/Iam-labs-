# Update-LabReadmes.ps1
# Creates/updates project folder structure + writes README content for:
# 03-conditional-access-baseline
# 04-sso-federation
# Then (optional) git add/commit/push

param(
  [string]$RepoRoot = "C:\IAM-Labs\Iam-labs-",
  [switch]$GitCommitAndPush
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir {
  param([Parameter(Mandatory)][string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    New-Item -ItemType Directory -Path $Path | Out-Null
  }
}

function Write-TextFile {
  param(
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)][string]$Content
  )
  $dir = Split-Path -Parent $Path
  Ensure-Dir -Path $dir
  Set-Content -LiteralPath $Path -Value $Content -Encoding UTF8
}

function Ensure-GitKeep {
  param([Parameter(Mandatory)][string]$Folder)
  Ensure-Dir -Path $Folder
  $gitkeep = Join-Path $Folder ".gitkeep"
  if (-not (Test-Path -LiteralPath $gitkeep)) {
    New-Item -ItemType File -Path $gitkeep | Out-Null
  }
}

# --- Validate repo root ---
if (-not (Test-Path -LiteralPath $RepoRoot)) {
  throw "Repo root not found: $RepoRoot"
}

# --- Project paths ---
$proj03 = Join-Path $RepoRoot "03-conditional-access-baseline"
$proj04 = Join-Path $RepoRoot "04-sso-federation"

# --- Ensure structure (minimal + engineered) ---
$foldersToEnsure = @(
  (Join-Path $proj03 "docs"),
  (Join-Path $proj03 "docs\screenshots"),
  (Join-Path $proj04 "docs"),
  (Join-Path $proj04 "docs\screenshots")
)

foreach ($f in $foldersToEnsure) { Ensure-Dir -Path $f }
Ensure-GitKeep -Folder (Join-Path $proj03 "docs\screenshots")
Ensure-GitKeep -Folder (Join-Path $proj04 "docs\screenshots")

# --- README content for 04 (SSO Federation) ---
$readme04 = @"
# SSO Federation Lab (SAML)

## Overview
This lab demonstrates configuring Single Sign-On (SSO) federation between a Service Provider and Microsoft Entra ID using the SAML protocol.

The goal of this project was to simulate a real-world enterprise application onboarding process where Entra ID acts as the Identity Provider (IdP) and issues SAML assertions to an external application.

---

## Architecture
User → Entra ID → SAML Assertion → Service Provider

---

## Configuration Steps
1. Created an **Enterprise Application** in Microsoft Entra ID.
2. Configured **SAML-based Single Sign-On**.
3. Defined **Entity ID and Reply URL** for the Service Provider.
4. Configured **user attributes and claims mapping**.
5. Generated **token signing certificates**.
6. Downloaded **federation metadata XML**.
7. Assigned users to the application.
8. Tested the SAML authentication flow.

---

## Attributes and Claims Mapping
The following claims were configured for the SAML token:
- givenname
- surname
- emailaddress
- name
- userprincipalname

These claims are used by the Service Provider to identify authenticated users.

---

## Token Signing Certificate
Microsoft Entra ID generated a **token signing certificate** used to sign the SAML assertion.

This ensures:
- token integrity
- trusted federation between IdP and Service Provider

---

## Authentication Validation
Successful SSO authentication was confirmed through:
- SAML test sign-in
- Entra ID sign-in logs
- successful federation response from the Service Provider

---

## Screenshots

### SAML Configuration
*(Screenshot here: sso-saml-configuration.png)*

### Token Signing Certificate and Federation Metadata
*(Screenshot here: sso-certificate-metadata.png)*

### Successful Entra ID Sign-in Log
*(Screenshot here: sso-signin-log-success.png)*

### Successful Federation Login to Service Provider
*(Screenshot here: sso-federation-success.png)*

---

## Key IAM Concepts Demonstrated
- SAML Federation
- Identity Provider (IdP) / Service Provider (SP)
- Claims-based authentication
- Token signing certificates
- Enterprise application onboarding
"@

# --- README content for 03 (Conditional Access + Identity Governance) ---
$readme03 = @"
# Conditional Access and Identity Governance Lab

## Overview
This project demonstrates implementing a Zero Trust security baseline using Microsoft Entra ID Conditional Access and Identity Governance.

The environment simulates a real enterprise governance model including:
- Access Packages
- Access Reviews
- Conditional Access policies
- Microsoft Graph automation

---

## Architecture
User → Entra ID → Conditional Access → Application Access  
Identity Governance → Access Packages → Access Reviews → Periodic Validation

---

## Governance Automation (Microsoft Graph)
Microsoft Graph PowerShell was used to automate governance configuration.

The automation performed the following actions:
1. Created an **Enterprise Governance Catalog**
2. Registered **security groups as catalog resources**
3. Created **Access Packages**
4. Configured **Access Reviews**
5. Generated a governance audit output

---

## Access Packages Created
Finance Auditor Access  
Read-only access to finance resources.

HR Confidential Access  
Restricted access to sensitive HR systems.

IT Privileged Operations  
Privileged access for IT administrators.

Each package included:
- approval workflows
- time-based access expiration
- governance review capability

---

## Access Reviews
An automated **quarterly access review** was created to ensure privileged access is periodically validated.

Review target: Finance Auditor group  
Purpose: Prevent privilege creep and enforce least privilege.

---

## Conditional Access Policy
A Conditional Access policy was created requiring **Multi-Factor Authentication (MFA)** for external users.

Policy configuration:
- Users: Guests or external users
- Applications: All cloud apps
- Grant control: Require MFA
- Mode: Report-only (for safe validation before enforcement)

---

## Screenshots

### Identity Governance Catalog Creation
*(Screenshot here: identity-governance-catalog-created.png)*

### Access Review Creation
*(Screenshot here: identity-governance-access-review.png)*

### Access Review Confirmation
*(Screenshot here: identity-governance-review-confirmation.png)*

### Catalog State Verification
*(Screenshot here: identity-governance-catalog-state.png)*

### Resource Registration into Catalog
*(Screenshot here: identity-governance-resource-registration.png)*

### Access Packages Created
*(Screenshot here: identity-governance-access-packages.png)*

### Access Package Policy Configuration
*(Screenshot here: identity-governance-policy-config.png)*

### Conditional Access MFA Policy
*(Screenshot here: conditional-access-mfa-policy.png)*

### Conditional Access Policy Created
*(Screenshot here: conditional-access-policy-created.png)*

### Access Package Resource Roles
*(Screenshot here: identity-governance-resource-roles.png)*

---

## Key IAM Concepts Demonstrated
- Identity Governance
- Access Packages
- Access Reviews
- Conditional Access
- MFA enforcement
- Microsoft Graph automation
- Privileged access lifecycle management
"@

# --- Write files ---
Write-TextFile -Path (Join-Path $proj04 "README.md") -Content $readme04
Write-TextFile -Path (Join-Path $proj03 "README.md") -Content $readme03

Write-Host "✅ Updated 03 and 04 READMEs + ensured docs/screenshots folders exist." -ForegroundColor Green
Write-Host "Next: copy your screenshots into:" -ForegroundColor Gray
Write-Host "  $($proj03)\docs\screenshots" -ForegroundColor Cyan
Write-Host "  $($proj04)\docs\screenshots" -ForegroundColor Cyan

# --- Optional git commit/push ---
if ($GitCommitAndPush) {
  Push-Location $RepoRoot
  try {
    git status | Out-Host
    git add .
    git commit -m "Update project 03 & 04 READMEs and screenshot placeholders"
    git push
    Write-Host "✅ Committed and pushed to GitHub." -ForegroundColor Green
  } finally {
    Pop-Location
  }
} else {
  Write-Host "ℹ️ Git not run. If you want auto commit/push, re-run with -GitCommitAndPush" -ForegroundColor Yellow
}