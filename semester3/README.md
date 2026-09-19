# semester3

The build phase of the **Enterprise Identity Security Platform (EISP)**: requirements, architecture diagrams, IAM policies, a risk register, and the Month 1 plan and progress log.

## Chosen stack

The requirements and diagrams settle on **authentik** as the identity provider, **AWS IAM** for access control, **HashiCorp Vault** for secrets, and **Wazuh** as the SIEM, with a Kali Linux lab for security testing. `Techstack.docx` records how the stack changed: a first recommendation (Keycloak, Vault, Wazuh, Grafana) and a revised, AWS-centered one (AWS IAM, Cognito, Parameter Store, CloudTrail with GuardDuty, and CloudWatch dashboards).

## Contents

### Requirements and design

| File | What it is |
|------|------------|
| `Manisha_Gupta_EISP_Design_Document_v1.1.docx` | The design document (v1.1) covering problem statement, goals, features, and tech stack. A later-edited copy of the file in `semester2`. |
| `EISP_BRD_v1.docx` | **Business Requirements Document** for the 90-day capstone: business problems, objectives, scope, stakeholders, requirements for IAM, secrets, threat detection, and compliance, constraints, success criteria, and business risks. |
| `EISP_FRD_v1.docx` | **Functional Requirements Document**: component architecture and authentication data flow, then numbered requirements for each component (identity provider `FR-IDP`, AWS `FR-AWS`, Vault `FR-VLT`, and SIEM `FR-SIEM`). |
| `Techstack.docx` | Two tables comparing the original and revised technology recommendations, with cost. |

### Architecture diagrams

| File | What it is |
|------|------------|
| `zero_trust_architecture.svg` | Layered Zero Trust model: identity sources (people, service accounts, machine identities, lab systems), the identity layer (authentik with SSO, MFA, SCIM), the access control layer (AWS IAM roles and just-in-time access), and the AWS VPC layer. |
| `aws_vpc_infrastructure.svg` | The AWS network: a `10.0.0.0/16` VPC with a public subnet (jump host), two private subnets (Vault and Wazuh), and an isolated subnet (Kali lab), showing route tables and security groups. |

### Access control and risk

| File | What it is |
|------|------------|
| `EISP_IAM_Policies.docx` | Three least-privilege AWS IAM policies (`EISP-Developer-Policy`, `EISP-SecurityAnalyst-Policy`, `EISP-IAMEngineer-Policy`) with JSON, console steps, a permission boundary to prevent privilege escalation, and testing guidance. |
| `EISP_Risk_Register.xlsx` | Three sheets: the **Risk Register** (ten risks, rated 2 Critical, 4 High, and 4 Medium, including credential theft, privilege escalation, hardcoded secrets, and Vault token compromise), a **Risk Summary**, and a **Monitoring SOP** listing review cadence and escalation for each risk. |

### Planning and progress

| File | What it is |
|------|------------|
| `EISP_Month1_Plan.xlsx` | Month 1 plan with three sheets: the weekly task plan, a **Rubric Tracker** for nine course rubric items, and **Weekly Milestones** from 2 of 9 rubric items done in week 1 to 9 of 9 by week 4. |
| `EISP_Month1_Plan 2.numbers` | Apple Numbers version of the Month 1 plan. |
| `EISP_Updated_ProjectPlan_revised.xlsx` | The revised 12-week project plan. Identical to the copy in `semester2`. |
| `DailyTaskSheet.txt` | Dated log of daily work from 30 March to 14 April 2026: updating Monday.com, cybersecurity basics, drafting the incident response plan and security policy, tool research, and learning Docker, LDAP/AD, and AWS account setup. |

### Learning notes

| File | What it is |
|------|------------|
| `EISP explanation simple words.docx` | A plain-language explanation of EISP and IAM, "explained like you're 10". |
| `Claude next steps.docx` | Saved notes from an AI-assistant session: a summary of the diagrams and IAM policy document, the next AWS steps (create policies, groups, and test users, then verify with the IAM Policy Simulator), and an explanation of how Zero Trust treats human users. |

## Related folders

- [`../semester2`](../semester2): the original design document and project plan.
- [`../eisp_authentik`](../eisp_authentik): the Docker Compose setup for the authentik identity provider.
- [`../cybersecurity_basics_1`](../cybersecurity_basics_1) and [`../cyber_threats_and_vulnerabilities_1`](../cyber_threats_and_vulnerabilities_1): the incident response plan, security policy, and lab work tracked in the rubric.
