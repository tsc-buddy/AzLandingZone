###
# Azure policy settings
###

module "policy_assignments" {
  source = "../../../../modules/policy-assignments"
  tag_governance_policyset_id             = module.policyset_definitions.tag_governance_policyset_id
  iam_governance_policyset_id             = module.policyset_definitions.iam_governance_policyset_id
  security_governance_policyset_id        = module.policyset_definitions.security_governance_policyset_id
  data_protection_governance_policyset_id = module.policyset_definitions.data_protection_governance_policyset_id
  compute_governance_policyset_id         = module.policyset_definitions.compute_governance_policyset_id
  la_workspace_id                         = module.audit_logs.la_workspace_id
  location                                = var.location 
  allowedlocations                        = var.allowedlocations
  listOfAllowedVMSKUs                     = var.listOfAllowedVMSKUs 
}

module "policy_definitions" {
  source = "../../../../modules/policy-definitions"

}

module "policyset_definitions" {
  source = "../../../../modules/policyset-definitions"

  custom_policies_tag_governance = [
    {
      policyID = module.policy_definitions.addTagToRG_policy_ids[0]
    },
    {
      policyID = module.policy_definitions.addTagToRG_policy_ids[1]
    },
    {
      policyID = module.policy_definitions.addTagToRG_policy_ids[2]
    },
    {
      policyID = module.policy_definitions.addTagToRG_policy_ids[3]
    },
    {
      policyID = module.policy_definitions.addTagToRG_policy_ids[4]
    },
    {
      policyID = module.policy_definitions.addTagToRG_policy_ids[5]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRG_policy_ids[0]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRG_policy_ids[1]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRG_policy_ids[2]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRG_policy_ids[3]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRG_policy_ids[4]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRG_policy_ids[5]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRGOverwriteExisting_policy_ids[0]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRGOverwriteExisting_policy_ids[1]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRGOverwriteExisting_policy_ids[2]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRGOverwriteExisting_policy_ids[3]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRGOverwriteExisting_policy_ids[4]
    },
    {
      policyID = module.policy_definitions.inheritTagFromRGOverwriteExisting_policy_ids[5]
    },
    {
      policyID = module.policy_definitions.bulkInheritTagsFromRG_policy_id
    }
  ]

  custom_policies_iam_governance = [
    {
      policyID = module.policy_definitions.auditRoleAssignmentType_user_policy_id
    },
    {
      policyID = module.policy_definitions.auditLockOnNetworking_policy_id
    }
  ]
}