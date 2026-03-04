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
