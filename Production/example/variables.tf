variable "github_token" {
  description = "The GitHub token for authentication"
  type        = string
  sensitive   = true
}

variable "repository_name" {
  description = "The name of the GitHub repository to create"
  type        = string
}

variable "repository_description" {
  description = "The description of the GitHub repository to create"
  type        = string
}

variable "repository_visibility" {
  description = "The visibility of the GitHub repository to create"
  type        = string
}

variable "code_owners" {
  description = "The codeowners of the GitHub repository to create"
  type        = string
}

variable "team_admin" {
  description = "The team admin of the GitHub repository to create"
  type        = list(string)
}

variable "team_writer" {
  description = "The team writer of the GitHub repository to create"
  type        = list(string)
}