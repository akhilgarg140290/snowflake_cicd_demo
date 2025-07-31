# Snowflake CI/CD Demo

This repository demonstrates a basic CI/CD pipeline for deploying SQL objects to Snowflake using the Snowflake Python Connector and GitHub Actions.

---

## 📁 Repository Structure

- `dev/` – SQL scripts for development: table creation, staging, and transformations
- `prod/` – Production-ready SQL scripts
- `cicd/` – CI/CD automation scripts (Bash and Python)
- `.github/workflows/` – GitHub Actions workflows for automated deployment

---

## 🔐 GitHub Secrets Configuration

To enable the CI/CD workflow, the following GitHub Secrets must be configured:

| Secret Name         | Description                             |
|---------------------|-----------------------------------------|
| `SNOWFLAKE_ACCOUNT` | Snowflake account identifier            |
| `SNOWFLAKE_USER`    | Snowflake username                      |
| `SNOWFLAKE_PASSWORD`| Snowflake password                      |
| `SNOWFLAKE_ROLE`    | Role with necessary privileges          |
| `SNOWFLAKE_DB`      | Target database name                    |
| `SNOWFLAKE_SCHEMA`  | Target schema name                      |
| `SNOWFLAKE_WH`      | Virtual warehouse name                  |

---

## 🚀 Deployment Instructions (Snowflake Trial or Standard Account)

1. Configure the required Snowflake credentials as **GitHub Secrets**.
2. Push your SQL code into the `dev/` folder and commit to the `dev` branch.
3. GitHub Actions will detect `.sql` file changes and deploy them to the `SNOWFLAKE_DB_DEV` environment ex- CICD_DEV.
4. After validation, move the validated SQL files to the `prod/` folder.
5. Commit the changes again to the `dev` branch.
6. Create a **Pull Request (PR)** from `dev` to `main` and assign a reviewer.
7. Upon approval, **merge** the PR to the `main` branch.
8. GitHub Actions will automatically deploy SQL files in the `prod/` folder to `SNOWFLAKE_DB_PROD` ex- CICD_PROD.
9. The CI/CD pipeline is triggered **only when `.sql` files are modified**.

---

## ✅ Features

- Automated deployment using GitHub Actions
- Environment separation (Dev and Prod)
- Pull request-based approvals for promoting changes
- Secure credential handling via GitHub Secrets

