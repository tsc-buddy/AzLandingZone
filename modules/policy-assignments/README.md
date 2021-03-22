# AzureRM Policy Assignments - Terraform child module

* Vendor reference [https://www.terraform.io/docs/providers/azurerm/r/policy_assignment.html](https://www.terraform.io/docs/providers/azurerm/r/policy_assignment.html)

## Terraform child module files

* `main.tf`
* `outputs.tf`
* `variables.tf`

## Terraform resources (main.tf)

| Resource Type | Resource name | Deployment Count
|:--------------|:--------------|:----------------
| azurerm_policy_assignment | `tag_governance` | 1
| azurerm_policy_assignment | `iam_governance` | 1
| azurerm_policy_assignment | `security_governance` | 1
| azurerm_policy_assignment | `data_protection_governance` | 1

## Terraform input variables (variables.tf)

| Name | Description | Type | Default Value
|:------|:-------------|:------|:---------
| `tag_governance_policyset_id` | The policy set definition id for tag_governance | `string` | null
| `iam_governance_policyset_id` | The policy set definition id for iam_governance | `string` | null
| `security_governance_policyset_id` | The policy set definition id for security_governance | `string` | null
| `data_protection_governance_policyset_id` | The policy set definition id for data_protection_governance | `string` | null

## Terraform output variables (outputs.tf)

| Name | Description | Value
|:-------|:-----------|:----------
| `tag_governance_assignment_id` | The policy assignment id for tag_governance | ${azurerm_policy_assignment.tag_governance.id}
| `tag_governance_assignment_identity` | The policy assignment identity for tag_governance | ${azurerm_policy_assignment.tag_governance.identity}
| `iam_governance_assignment_id` | The policy assignment id for iam_governance | ${azurerm_policy_assignment.iam_governance.id}
| `security_governance_assignment_id` | The policy assignment id for security_governance | ${azurerm_policy_assignment.security_governance.id}
| `security_governance_assignment_identity` | The policy assignment identity for security_governance | ${azurerm_policy_assignment.security_governance.identity}
| `data_protection_governance_assignment_id` | The policy assignment id for data_protection_governance | ${azurerm_policy_assignment.data_protection_governance.id}
