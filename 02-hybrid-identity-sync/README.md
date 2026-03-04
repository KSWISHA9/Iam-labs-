# Hybrid Identity Sync Engineering Lab

Company: **Wolfpak Innovations**

This project simulates a hybrid identity deployment and troubleshooting scenario between on-premises Active Directory and Microsoft Entra ID.

The environment mirrors how enterprise organizations synchronize identities between internal infrastructure and cloud identity platforms.

---

## Project Overview

Wolfpak Innovations required a hybrid identity architecture that would allow users from the internal Active Directory domain to authenticate and access cloud resources in Microsoft Entra ID.

The objective of this project was to design, deploy, and validate a secure synchronization pipeline between:

- On-Premises Active Directory
- Microsoft Entra Connect
- Microsoft Entra ID

---

## Infrastructure Deployed

Domain Controller deployed using **PowerShell automation**.

Services configured:

• Active Directory Domain Services  
• DNS  
• Organizational Unit structure  
• Identity objects for synchronization testing  

Domain:

wolfpak.local

---

## Identity Synchronization Architecture

Active Directory  
⬇  
Microsoft Entra Connect  
⬇  
Microsoft Entra ID

User objects and attributes synchronize through the Entra Connect engine, enabling hybrid authentication and centralized identity governance.

---

## Engineering Objectives

• Deploy Active Directory Domain Controller using PowerShell  
• Configure Microsoft Entra Connect synchronization  
• Validate attribute synchronization  
• Investigate synchronization pipeline behavior  
• Document hybrid identity troubleshooting workflow

---

## Project Documentation

Architecture

docs/architecture.md

Evidence

docs/evidence.md

Troubleshooting

docs/troubleshooting.md

---

## Security Significance

Hybrid identity environments introduce synchronization dependencies that must be monitored carefully.

Improper configuration can lead to:

• duplicate identities  
• authentication failures  
• broken access control policies  
• identity privilege drift

Understanding identity synchronization pipelines is critical for IAM engineers managing enterprise environments.

