# cyber_threats_and_vulnerabilities_1

Hands-on lab report for the **Cyber Threats and Vulnerabilities** course module. It records how a threat was identified, assessed, and turned into a risk-management and monitoring plan, using standard tools in a controlled lab environment.

## Contents

| File | What it is |
|------|------------|
| `ThreatsandVulnerablility.docx` | "Cybersecurity Operations & Risk Management Report", a five-phase write-up of the lab work. |

## What the report covers

1. **Cyber threat identification and analysis**
   - *Malware analysis:* a suspicious executable disguised as `NOTEPAD.EXE` was checked on VirusTotal (flagged by 26 of 71 vendors; Trojan with persistence and debugger-detection behaviour).
   - *Phishing simulation:* a credential-harvesting attack built with the Social Engineering Toolkit (SET) on Kali Linux, cloning a Google sign-in page.
   - *MITRE ATT&CK mapping:* the observed techniques mapped to a real-world campaign by the APT28 (Fancy Bear) group, in a Tactic / Technique ID / Technique Name / Observation table.
2. **Vulnerability assessment techniques**
   - Asset discovery and network mapping with Nmap across the lab subnet.
   - Vulnerability scan with the Nmap Scripting Engine, including a High-severity finding (CVSS 7.5) for credentials sent over unencrypted HTTP.
3. **Threat intelligence principles**
   - Network and host indicators of compromise (IoCs) and how to act on them.
   - An OpenCTI platform deployed with Docker, with the AlienVault OTX and MITRE ATT&CK connectors.
4. **Risk management strategies**
   - A risk table listing description, severity, treatment, and recommended mitigation.
5. **Security monitoring and incident response**
   - A detection rule for a workstation unexpectedly listening on ports 80/443, and a credential-compromise incident response scenario (identify, contain, eradicate, lessons learned).

## Notes

- All activity was performed in an isolated lab. The addresses, accounts, and captured values in the report come from the simulation and are not real credentials.
- This work supports the Cyber Threats rubric items (CT #1 to CT #5) tracked in the Month 1 plan in [`../semester3`](../semester3).
- The lab environment (Kali Linux VM in an isolated subnet) is the same one drawn in `semester3/aws_vpc_infrastructure.svg`.

## Related folders

- [`../cybersecurity_basics_1`](../cybersecurity_basics_1): the companion module on policies, incident response, and encryption.
- [`../semester3`](../semester3): the Enterprise Identity Security Platform (EISP) project that this coursework feeds into.
