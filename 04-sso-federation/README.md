# SSO Federation Lab

This project demonstrates the configuration and validation of Single Sign-On (SSO) using federation protocols within a Microsoft Entra ID environment.

The lab focuses on implementing identity federation and validating authentication flows between identity providers and applications.

## Objectives

• Configure SAML / OIDC based federation  
• Validate identity tokens issued by the identity provider  
• Test authentication flows between applications and Entra ID  
• Document troubleshooting scenarios related to federation failures  

## Environment

Identity Provider: Microsoft Entra ID  
Protocols: SAML 2.0 and OpenID Connect  
Authentication Source: Hybrid Active Directory  

## Implementation

The federation process included:

• configuring application federation settings  
• establishing trust relationships between identity providers  
• validating authentication assertions  
• testing SSO authentication flows  

## Validation

Users were able to authenticate once and gain access to federated applications without re-entering credentials.

Token issuance and authentication responses were validated to confirm successful federation.

## Documentation

Detailed configuration steps and screenshots are available in:

docs/evidence.md
