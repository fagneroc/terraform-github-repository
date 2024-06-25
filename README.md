# GitHub Repository Automation with Terraform 

This project automates the creation and management of repositories on GitHub, including necessary files, permissions and webhooks using Terraform.
The automation is triggered through GitHub Actions workflows that identify pushes to the main branch.

## Features

- Automated repository creation.
- Configuration of branch protection rules.
- Setup of webhooks.
- Management of team permissions.
- Terraform state control in s3 bucket.

## Getting Started

### Prerequisites

- AWS CLI user with appropriate permissions for S3 bucket.
- GitHub personal access token with required permissions.

### Setup

1. **Project Repository:**

    Ensure your repository has proper permission settings.

2. **Configure AWS credentials:**

    Ensure your AWS credentials are set up to allow Terraform to interact with AWS S3.

3. **Set up GitHub Secrets:**

    Go to your GitHub repository settings and add the following secrets:
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY`
    - `AWS_REGION`
    - `TOKEN_GITHUB`

### GitHub Actions Workflow

The workflow file is located at `.github/workflows/main.yml` and includes steps for:

- Checking out the repository.
- Configuring AWS credentials.
- Setting up Terraform.
- Listing modified directories in the last commit and applying Terraform configurations to those directories.

### Future releases

- List the directories removed in the last commit and application Terraform destroy.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
