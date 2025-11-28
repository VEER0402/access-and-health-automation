# DevOps Automation Project
**Automated User Access Auditing & Instance Health Monitoring Pipeline**

**Short summary:**  
Shell-script based DevOps automation that demonstrates GitHub API automation (collaborator reporting & revocation) and EC2 instance health checks (AWS CLI simulated via LocalStack). Cron examples and logging make this project production-like.

---

## 🚀 Why this project
This repo is a compact, real-world DevOps automation pipeline built using Bash, `curl`, `jq`, and (optionally) LocalStack to simulate AWS. It demonstrates typical day-to-day tasks done by a DevOps engineer:
- auditing repository access,
- generating daily reports,
- performing instance health checks,
- scheduling via cron,
- and logging outputs to timestamped files.

This project shows practical automation skills, secure secret-handling patterns, and a production-ish structure you can demo in interviews.

---

## 🧩 Tech stack
- Bash (`/usr/bin/env bash`)
- `curl` (GitHub API)
- `jq` (JSON parsing)
- `aws` CLI (optional: LocalStack endpoint for local testing)
- `tee` for logging
- Cron (example schedules included)

---

## ✅ Features
- `github_access_report.sh` — lists collaborators and permissions for a repo (admin/push/pull).
- `aws_instance_health.sh` — checks EC2 instance state (works with real AWS or simulated LocalStack).
- `menu.sh` — interactive menu to run reports and checks.
- Logging: timestamped logs saved to `/logs/`.
- `cron/daily_automation.cron` — example cron entries demonstrating scheduled automation.
- Secure pattern: uses environment variables for secrets (`GITHUB_USER`, `GITHUB_TOKEN`).

---

## 📁 Project structure

devops-automation-project/
├── scripts/
│ ├── github_access_report.sh
│ ├── aws_instance_health.sh
│ ├── menu.sh
│ └── utils.sh
├── logs/
├── cron/
│ └── daily_automation.cron
└── README.md




Setup (safe secret handling)

Export your GitHub token in your shell (do NOT hardcode tokens in scripts):

export GITHUB_USER="your-github-username"
export GITHUB_TOKEN="ghp_xxx..."  



How to run (demo)

From repository root:

cd scripts
# make sure scripts are executable
chmod +x *.sh

# run interactive menu
./menu.sh

# or run directly:
./github_access_report.sh <owner> <repo>
./aws_instance_health.sh

