provider "github" {
  token = var.github_token
  owner = "fagneroc"
}

resource "github_repository" "repository" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = var.repository_visibility
  auto_init   = false
  has_wiki    = true
  has_issues  = true
  has_projects = true
}

resource "github_team_repository" "team_writer" {
  for_each   = { for team in var.team_writer : team => team }
  team_id    = each.key
  repository = github_repository.repository.name
  permission = "push"
}

resource "github_team_repository" "team_admin" {
  for_each   = { for team in var.team_admin : team => team }
  team_id    = each.key
  repository = github_repository.repository.name
  permission = "admin"
}

resource "github_repository_file" "codeowners" {
  repository = github_repository.repository.name
  file       = ".github/CODEOWNERS"
  content    = var.code_owners
}

resource "github_repository_webhook" "Webhook_Name" {
  repository = github_repository.repository.name
  configuration {
    url          = "https://my.webhook.com/path/"
    content_type = "json"
    insecure_ssl = false
    secret       = ""
  }
  events = ["push", "pull_request"]
}

resource "github_branch_protection_v3" "repository_ruleset" {
  repository = github_repository.repository.name
  branch     = "main"
  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews          = true
    require_code_owner_reviews     = true
    required_approving_review_count = 1
    require_last_push_approval = true      
    bypass_pull_request_allowances {
      users = ["fagneroc"]
      teams = [""]
    }
  }
  
  depends_on = [
    github_repository_file.codeowners
  ]
}

resource "github_branch" "dev" {
  repository = github_repository.repository.name
  branch     = "dev"
  source_branch = "main"

  lifecycle {
    ignore_changes = [branch]
  }

  depends_on = [
    github_branch_protection_v3.repository_ruleset
  ]
}