# Hybrid Identity Architecture
<img width="1550" height="659" alt="Screenshot 2026-03-06 161155" src="https://github.com/user-attachments/assets/7917f272-c195-4cca-8964-13271d6889ff" />

Organization: Wolfpak Innovations

This architecture demonstrates synchronization between on-premises Active Directory and Microsoft Entra ID.

Components:

Active Directory Domain Controller  
Microsoft Entra Connect Sync Engine  
Microsoft Entra ID Cloud Directory

---

## Identity Flow

1. User created in Active Directory

2. Entra Connect reads directory objects

3. Attributes are transformed

4. Identity objects synchronize to Entra ID

---

## Infrastructure Components

Active Directory Domain Controller

Windows Server 2022  
PowerShell domain configuration  
DNS services  

Microsoft Entra Connect

Synchronization engine  
Attribute mapping  
Sync scheduler  

Microsoft Entra ID

Cloud identity directory  
Authentication platform  
Access control enforcement

