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
