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
