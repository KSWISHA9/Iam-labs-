# Hybrid Identity Troubleshooting

This project also simulates troubleshooting hybrid identity synchronization issues.

Common issues investigated include:

---

## Attribute Mismatch

Incorrect attribute mapping may cause synchronization failures.

Example attributes:

userPrincipalName  
immutableID  
objectGUID

---

## Duplicate Identities

Duplicate identities may appear when:

Cloud accounts exist before synchronization begins.

---

## Sync Cycle Failures

Synchronization cycles can fail due to:

connector errors  
credential issues  
attribute conflicts

---

## Investigation Tools

Synchronization Service Manager  
PowerShell ADSync module  
Entra ID portal diagnostics

