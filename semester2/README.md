# semester2

Planning and design materials for my capstone project, the **Enterprise Identity Security Platform (EISP)**, plus my cohort showcase presentation and the job description for the role I am working toward (IAM Engineer).

## About EISP

EISP is a Zero Trust identity and access management (IAM) platform. Its design document describes an integrated solution for:

- Automated identity lifecycle management (joiner, mover, leaver)
- Zero Trust access control with role-based access control (RBAC)
- Governance of non-human identities such as service accounts, API keys, and tokens
- Identity threat detection and response

It targets four problems: manual identity provisioning, privilege creep, unsecured machine identities, and identity-based attacks. Planned features include identity provider integration, single sign-on, RBAC, passwordless authentication, and infrastructure as code.

## Contents

| File | What it is |
|------|------------|
| `Manisha_Gupta_Enterprise_Identity_Security_Platform_Design_Document.docx` | The original EISP design document, including an architecture diagram: problem statement, goals, key features, and tech stack. |
| `Manisha_Gupta_EISP_Design_Document_v1.1.docx` | Version 1.1 of the design document. It adds a fifth challenge (lack of proactive threat intelligence), a fifth goal (cyber threat analysis and security foundations), and a Cyber Threat Analysis Module feature. A later copy is in `semester3`. |
| `EISP_12Week_ProjectPlan_Monday.xlsx` | The original 12-week project plan (30 March to 25 June 2026), organized into phases with weekly tasks, descriptions, and dates. Built for Monday.com. |
| `EISP_Updated_ProjectPlan_revised.xlsx` | The revised plan, with more detailed tasks than the original. Same dates. |
| `Manisha_IAMCohort_Showcase.pptx` | An 11-slide cohort showcase: Month 1 foundations, the GoFit app and how it works, EISP and its architecture and goals, and contact details. |
| `IAM Engineer.pdf` | A five-page IAM Engineer job description (solution architecture, custom integration development, process automation, security and compliance, incident resolution, and mentoring), used to shape the project toward that role. |
| `git_status_output.txt` | Saved output of a `git status` command from a Git exercise. It is UTF-16 encoded, so it may look garbled in some editors. |

## Suggested reading order

1. `IAM Engineer.pdf` for the target role.
2. The design document (original, then v1.1) for what EISP is.
3. The project plan (original, then revised) for how it will be delivered.
4. `Manisha_IAMCohort_Showcase.pptx` for the summary presentation.

## Related folders

- [`../semester3`](../semester3): the requirements documents, IAM policies, architecture diagrams, and risk register that follow this design work.
- [`../pyhton_1`](../pyhton_1): the GoFit app featured in the showcase.
- [`../docs`](../docs): the portfolio website where the project is summarized.
