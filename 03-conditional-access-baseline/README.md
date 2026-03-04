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
