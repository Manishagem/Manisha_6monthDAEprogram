# cybersecurity_basics_1

Deliverables for the **Cybersecurity Basics** course module: an incident response plan, a security policy, and an encryption/hashing exercise. The first two are written for the Enterprise Identity Security Platform (EISP) project and focus on one scenario, **credential theft and account compromise**.

## Contents

| File | What it is |
|------|------------|
| `EISP_IRP_Credential_Theft.docx` | Incident Response Plan (Document ID `EISP-IRP-001`) for credential theft and account compromise. |
| `EISP_Security_Policy_Credential_Theft.docx` | Comprehensive Security Policy (Document ID `EISP-SP-002`) covering credential theft prevention, response, and the CIA Triad. |
| `Encryption Decryption.docx` | Lab notes and screenshots from an encryption and hashing exercise. |

## Incident Response Plan (`EISP-IRP-001`)

- Aligned to the **NIST SP 800-61 Rev. 2** incident-handling lifecycle and uses **MITRE ATT&CK** to describe attacker behaviour.
- Defines what credential theft means in the EISP context, the ways credentials are stolen, and indicators of compromise, grouped into authentication anomalies (for example impossible travel, MFA-fatigue patterns), access-behaviour anomalies, and machine-identity/secrets anomalies.
- Includes a severity classification, a roles and responsibilities section, and phase-by-phase response procedures beginning with Preparation.
- Scope covers user accounts, privileged accounts, machine identities, Vault secrets, and AWS credentials; physical breaches and non-identity network intrusions are out of scope.

## Security Policy (`EISP-SP-002`)

- Applies to Entra ID and Okta accounts, admin accounts, API keys and service tokens, HashiCorp Vault secrets, AWS IAM credentials, and SSO/OAuth/SAML tokens.
- States mandatory rules with a rationale, requirements, enforcement controls, and violations for each. Examples:
  - **MFA for every identity**, with FIDO2 keys preferred, number matching on push prompts, and SMS prohibited for privileged accounts.
  - **Least privilege and RBAC**, with role assignment only through defined roles and just-in-time elevation for privileged access.
- Maps each control back to Confidentiality, Integrity, and Availability, and lists the governing frameworks.

## Encryption exercise

- **AES encryption and decryption** in CBC mode with a hex key, an initialization vector (IV), and PKCS5 padding. Output is Base64. The same key and IV are required to recover the original text.
- **Hashing** with MD5 and SHA-1, showing that changing a single character of the input (`MyPassword` to `MyPassworD`) produces a completely different hash.

## How this fits the project

These documents cover the Cybersecurity Basics rubric items (incident response plan, security policy, encryption) tracked in the Month 1 plan in [`../semester3`](../semester3). The policy and plan are written against the EISP design in [`../semester2`](../semester2).

## Related folders

- [`../cyber_threats_and_vulnerabilities_1`](../cyber_threats_and_vulnerabilities_1): the companion threat and vulnerability lab.
- [`../semester3`](../semester3): the EISP requirements, IAM policies, and risk register.
