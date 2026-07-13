variable "organization_rulesets" {
  description = <<EOT
Map of organization_rulesets, attributes below
Required:
    - enforcement
    - name
    - target
    - rules (block):
        - branch_name_pattern (optional, block):
            - name (optional)
            - negate (optional)
            - operator (required)
            - pattern (required)
        - commit_author_email_pattern (optional, block):
            - name (optional)
            - negate (optional)
            - operator (required)
            - pattern (required)
        - commit_message_pattern (optional, block):
            - name (optional)
            - negate (optional)
            - operator (required)
            - pattern (required)
        - committer_email_pattern (optional, block):
            - name (optional)
            - negate (optional)
            - operator (required)
            - pattern (required)
        - copilot_code_review (optional, block):
            - review_draft_pull_requests (optional)
            - review_on_push (optional)
        - creation (optional)
        - deletion (optional)
        - file_extension_restriction (optional, block):
            - restricted_file_extensions (required)
        - file_path_restriction (optional, block):
            - restricted_file_paths (required)
        - max_file_path_length (optional, block):
            - max_file_path_length (required)
        - max_file_size (optional, block):
            - max_file_size (required)
        - non_fast_forward (optional)
        - pull_request (optional, block):
            - allowed_merge_methods (optional)
            - dismiss_stale_reviews_on_push (optional)
            - require_code_owner_review (optional)
            - require_last_push_approval (optional)
            - required_approving_review_count (optional)
            - required_review_thread_resolution (optional)
            - required_reviewers (optional, block):
                - file_patterns (required)
                - minimum_approvals (required)
                - reviewer (required, block):
                    - id (required)
                    - type (required)
        - required_code_scanning (optional, block):
            - required_code_scanning_tool (required, block):
                - alerts_threshold (required)
                - security_alerts_threshold (required)
                - tool (required)
        - required_linear_history (optional)
        - required_signatures (optional)
        - required_status_checks (optional, block):
            - do_not_enforce_on_create (optional)
            - required_check (required, block):
                - context (required)
                - integration_id (optional)
            - strict_required_status_checks_policy (optional)
        - required_workflows (optional, block):
            - do_not_enforce_on_create (optional)
            - required_workflow (required, block):
                - path (required)
                - ref (optional)
                - repository_id (required)
        - tag_name_pattern (optional, block):
            - name (optional)
            - negate (optional)
            - operator (required)
            - pattern (required)
        - update (optional)
Optional:
    - bypass_actors (block):
        - actor_id (optional)
        - actor_type (required)
        - bypass_mode (required)
    - conditions (block):
        - ref_name (optional, block):
            - exclude (required)
            - include (required)
        - repository_id (optional)
        - repository_name (optional, block):
            - exclude (required)
            - include (required)
            - protected (optional)
        - repository_property (optional, block):
            - exclude (optional, block):
                - name (optional)
                - property_values (optional)
                - source (optional)
            - include (optional, block):
                - name (optional)
                - property_values (optional)
                - source (optional)
EOT

  type = map(object({
    enforcement = string
    name        = string
    target      = string
    rules = object({
      branch_name_pattern = optional(object({
        name     = optional(string)
        negate   = optional(bool)
        operator = string
        pattern  = string
      }))
      commit_author_email_pattern = optional(object({
        name     = optional(string)
        negate   = optional(bool)
        operator = string
        pattern  = string
      }))
      commit_message_pattern = optional(object({
        name     = optional(string)
        negate   = optional(bool)
        operator = string
        pattern  = string
      }))
      committer_email_pattern = optional(object({
        name     = optional(string)
        negate   = optional(bool)
        operator = string
        pattern  = string
      }))
      copilot_code_review = optional(object({
        review_draft_pull_requests = optional(bool)
        review_on_push             = optional(bool)
      }))
      creation = optional(bool)
      deletion = optional(bool)
      file_extension_restriction = optional(object({
        restricted_file_extensions = set(string)
      }))
      file_path_restriction = optional(object({
        restricted_file_paths = list(string)
      }))
      max_file_path_length = optional(object({
        max_file_path_length = number
      }))
      max_file_size = optional(object({
        max_file_size = number
      }))
      non_fast_forward = optional(bool)
      pull_request = optional(object({
        allowed_merge_methods             = optional(list(string))
        dismiss_stale_reviews_on_push     = optional(bool)
        require_code_owner_review         = optional(bool)
        require_last_push_approval        = optional(bool)
        required_approving_review_count   = optional(number)
        required_review_thread_resolution = optional(bool)
        required_reviewers = optional(list(object({
          file_patterns     = list(string)
          minimum_approvals = number
          reviewer = object({
            id   = number
            type = string
          })
        })))
      }))
      required_code_scanning = optional(object({
        required_code_scanning_tool = list(object({
          alerts_threshold          = string
          security_alerts_threshold = string
          tool                      = string
        }))
      }))
      required_linear_history = optional(bool)
      required_signatures     = optional(bool)
      required_status_checks = optional(object({
        do_not_enforce_on_create = optional(bool)
        required_check = list(object({
          context        = string
          integration_id = optional(number)
        }))
        strict_required_status_checks_policy = optional(bool)
      }))
      required_workflows = optional(object({
        do_not_enforce_on_create = optional(bool)
        required_workflow = list(object({
          path          = string
          ref           = optional(string)
          repository_id = number
        }))
      }))
      tag_name_pattern = optional(object({
        name     = optional(string)
        negate   = optional(bool)
        operator = string
        pattern  = string
      }))
      update = optional(bool)
    })
    bypass_actors = optional(list(object({
      actor_id    = optional(number)
      actor_type  = string
      bypass_mode = string
    })))
    conditions = optional(object({
      ref_name = optional(object({
        exclude = list(string)
        include = list(string)
      }))
      repository_id = optional(list(number))
      repository_name = optional(object({
        exclude   = list(string)
        include   = list(string)
        protected = optional(bool)
      }))
      repository_property = optional(object({
        exclude = optional(list(object({
          name            = optional(string)
          property_values = optional(list(string))
          source          = optional(string)
        })))
        include = optional(list(object({
          name            = optional(string)
          property_values = optional(list(string))
          source          = optional(string)
        })))
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.organization_rulesets : (
        v.rules.required_code_scanning == null || (length(v.rules.required_code_scanning.required_code_scanning_tool) >= 1)
      )
    ])
    error_message = "Each required_code_scanning_tool list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.organization_rulesets : (
        v.rules.required_status_checks == null || (length(v.rules.required_status_checks.required_check) >= 1)
      )
    ])
    error_message = "Each required_check list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.organization_rulesets : (
        v.rules.required_workflows == null || (length(v.rules.required_workflows.required_workflow) >= 1)
      )
    ])
    error_message = "Each required_workflow list must contain at least 1 items"
  }
  # --- Unconfirmed validation candidates, derived from github_organization_ruleset's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) >= 1 && length(value) <= 100
  #   message:   must be between 1 and 100 characters
  # path: target
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: enforcement
  #   condition: contains(["disabled", "active", "evaluate"], value)
  #   message:   must be one of: disabled, active, evaluate
  # path: bypass_actors.actor_type
  #   condition: contains(["Integration", "OrganizationAdmin", "RepositoryRole", "Team", "DeployKey", "EnterpriseOwner"], value)
  #   message:   must be one of: Integration, OrganizationAdmin, RepositoryRole, Team, DeployKey, EnterpriseOwner
  # path: bypass_actors.bypass_mode
  #   condition: contains(["always", "pull_request", "exempt"], value)
  #   message:   must be one of: always, pull_request, exempt
  # path: conditions.repository_property.include.source
  #   condition: contains(["custom", "system"], value)
  #   message:   must be one of: custom, system
  # path: conditions.repository_property.exclude.source
  #   condition: contains(["custom", "system"], value)
  #   message:   must be one of: custom, system
  # path: rules.pull_request.allowed_merge_methods[*]
  #   condition: contains(["merge", "squash", "rebase"], value)
  #   message:   must be one of: merge, squash, rebase
  # path: rules.pull_request.required_approving_review_count
  #   condition: value >= 0 && value <= 10
  #   message:   must be between 0 and 10
  # path: rules.pull_request.required_reviewers.reviewer.type
  #   condition: contains(["Team"], value)
  #   message:   must be one of: Team
  # path: rules.required_status_checks.required_check.context
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: rules.commit_message_pattern.operator
  #   source:    operatorValidation (unresolved: func operatorValidation not found in /home/dan/code/public/terraform-provider-github/github)
  # path: rules.commit_author_email_pattern.operator
  #   source:    operatorValidation (unresolved: func operatorValidation not found in /home/dan/code/public/terraform-provider-github/github)
  # path: rules.committer_email_pattern.operator
  #   source:    operatorValidation (unresolved: func operatorValidation not found in /home/dan/code/public/terraform-provider-github/github)
  # path: rules.branch_name_pattern.operator
  #   source:    operatorValidation (unresolved: func operatorValidation not found in /home/dan/code/public/terraform-provider-github/github)
  # path: rules.tag_name_pattern.operator
  #   source:    operatorValidation (unresolved: func operatorValidation not found in /home/dan/code/public/terraform-provider-github/github)
  # path: rules.required_workflows.required_workflow.path
  #   condition: can(regex("^\\.github\\/workflows\\/.*$", value))
  #   message:   Path must be in the .github/workflows directory
  # path: rules.required_code_scanning.required_code_scanning_tool.alerts_threshold
  #   condition: contains(["none", "errors", "errors_and_warnings", "all"], value)
  #   message:   must be one of: none, errors, errors_and_warnings, all
  # path: rules.required_code_scanning.required_code_scanning_tool.security_alerts_threshold
  #   condition: contains(["none", "critical", "high_or_higher", "medium_or_higher", "all"], value)
  #   message:   must be one of: none, critical, high_or_higher, medium_or_higher, all
  # path: rules.max_file_size.max_file_size
  #   condition: value >= 1 && value <= 100
  #   message:   must be between 1 and 100
  # path: rules.max_file_path_length.max_file_path_length
  #   condition: value >= 1 && value <= 32767
  #   message:   must be between 1 and 32767
}

