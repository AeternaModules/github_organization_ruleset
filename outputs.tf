output "organization_rulesets_id" {
  description = "Map of id values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.id }
}
output "organization_rulesets_bypass_actors" {
  description = "Map of bypass_actors values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.bypass_actors }
}
output "organization_rulesets_conditions" {
  description = "Map of conditions values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.conditions }
}
output "organization_rulesets_enforcement" {
  description = "Map of enforcement values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.enforcement }
}
output "organization_rulesets_etag" {
  description = "Map of etag values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.etag }
}
output "organization_rulesets_name" {
  description = "Map of name values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.name }
}
output "organization_rulesets_node_id" {
  description = "Map of node_id values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.node_id }
}
output "organization_rulesets_rules" {
  description = "Map of rules values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.rules }
}
output "organization_rulesets_ruleset_id" {
  description = "Map of ruleset_id values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.ruleset_id }
}
output "organization_rulesets_target" {
  description = "Map of target values across all organization_rulesets, keyed the same as var.organization_rulesets"
  value       = { for k, v in github_organization_ruleset.organization_rulesets : k => v.target }
}

