# Hybrid Identity Architecture

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

