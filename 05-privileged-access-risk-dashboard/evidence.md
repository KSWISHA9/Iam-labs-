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
