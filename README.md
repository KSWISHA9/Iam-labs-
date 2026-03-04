# Enterprise IAM Engineering Portfolio

This repository contains enterprise-style Identity & Access Management engineering projects built as hands-on labs.

---

## Projects (Click to Open)

| # | Project | Description |
|---:|---|---|
| 01 | [AD Offboarding Engine](./01-ad-offboarding-engine) | Automated deprovisioning workflow: disable account, remove access groups, move to Terminated OU, and produce evidence |
| 02 | [Hybrid Identity Sync Engineering](./02-hybrid-identity-sync) | AD ↔ Entra ID synchronization validation and troubleshooting using Entra Connect |
| 03 | [Conditional Access Security Baseline](./03-conditional-access-baseline) | Zero Trust baseline: MFA enforcement, legacy auth blocking, admin protection policies |
| 04 | [SSO Federation Lab](./04-sso-federation) | SAML / OIDC federation configuration with token validation and troubleshooting runbook |
| 05 | [Privileged Access Risk Dashboard](./05-privileged-access-risk-dashboard) | Microsoft Graph automation to identify risky apps/roles (ownerless apps, expired credentials, stale sign-ins) |

---

## Repo Standard (Per Project)

Each project includes:

- README.md — overview + what was built
- rchitecture.md — design notes
- docs/evidence.md — screenshots + explanation
- docs/screenshots/ — evidence images
- src/ — scripts and automation
