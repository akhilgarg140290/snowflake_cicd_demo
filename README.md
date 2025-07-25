# Snowflake CI/CD Demo

This repo demonstrates a basic CI/CD setup for Snowflake using GitHub Actions.

## Structure
- `dev/` – SQL scripts for table creation, staging, and transformation
- `prod/` – Production-ready SQLs
- `cicd/` – Automation scripts (Bash + GitHub Actions)

## How to Deploy
1. Configure Snowflake credentials in GitHub Secrets
2. Push code to `dev` branch
3. GitHub Actions will automatically deploy the pipeline
