# Conditional Access Security Baseline

This lab demonstrates the design and implementation of a Conditional Access security baseline using Microsoft Entra ID.

The goal was to implement core Zero Trust access controls to protect identities, enforce MFA, and block insecure authentication methods.

## Objectives

• Enforce multi-factor authentication for users  
• Protect privileged accounts with stricter policies  
• Block legacy authentication protocols  
• Apply conditional access based on user and application context  

## Environment

Platform: Microsoft Entra ID  
Identity Source: Hybrid Active Directory environment  
Authentication: Password Hash Sync  

## Policies Implemented

### Global MFA Enforcement
All users are required to register and use multi-factor authentication when accessing cloud applications.

### Admin Protection Policy
Privileged role holders must authenticate with MFA and comply with stricter security controls.

### Legacy Authentication Block
Legacy protocols such as IMAP, POP3, and other non-modern authentication methods are blocked.

### Secure Access Validation
Policies were tested against user logins to validate enforcement and access behavior.

## Security Impact

These controls significantly reduce identity compromise risk by ensuring that:

• stolen passwords alone cannot grant access  
• outdated authentication methods cannot be exploited  
• administrative identities are protected with stronger verification  

## Documentation

Evidence and screenshots are available in:

docs/evidence.md
