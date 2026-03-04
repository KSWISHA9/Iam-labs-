# Evidence

This section documents verification of hybrid identity synchronization.

Screenshots placed in:

docs/screenshots

---

## Domain Controller Deployment

PowerShell commands used to verify Active Directory domain configuration.

---

## Entra Connect Installation

Configuration of Microsoft Entra Connect to enable hybrid identity synchronization.

---

## Synchronization Engine Operations

Validation of import, delta synchronization, and export operations.

---

## PowerShell Sync Validation

Manual synchronization cycle executed using:

Start-ADSyncSyncCycle -PolicyType Delta

---

## Entra ID Object Synchronization

Verification that user objects successfully synchronized from Active Directory to Microsoft Entra ID.

