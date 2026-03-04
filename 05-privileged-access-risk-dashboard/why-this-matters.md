# Why This Matters

Modern cloud environments rely heavily on service principals and application identities.  
Without proper monitoring, these identities can become a major attack surface.

This project demonstrates how automated analysis of Microsoft Entra ID application identities can identify several high-risk conditions.

---

## Security Risks Addressed

### Ownerless Applications
Applications without assigned owners create an accountability gap.  
If credentials are compromised or permissions abused, no clear system owner exists to investigate or remediate the issue.

---

### Expired or Expiring Credentials
Applications often rely on client secrets or certificates for authentication.

Expired credentials can cause service outages, while credentials nearing expiration may indicate poor credential lifecycle management.

Automated monitoring ensures these issues are detected before they impact production systems.

---

### Stale or Inactive Applications
Applications that have not signed in recently may represent unused or abandoned integrations.

These applications should be reviewed and potentially removed to reduce attack surface.

---

### Privileged Application Access
Applications with excessive permissions or elevated roles represent a high-value target for attackers.

Identifying these identities allows security teams to review access levels and enforce least privilege.

---

## Operational Value

By using Microsoft Graph and PowerShell automation to generate a risk summary, this project demonstrates how organizations can:

• Continuously monitor identity exposure  
• Detect high-risk service principals  
• Improve governance over application identities  
• Reduce the likelihood of credential abuse  

---

## IAM Engineering Concepts Demonstrated

- Microsoft Graph API automation
- Service principal analysis
- Credential lifecycle monitoring
- Privileged access visibility
- Identity security posture assessment
