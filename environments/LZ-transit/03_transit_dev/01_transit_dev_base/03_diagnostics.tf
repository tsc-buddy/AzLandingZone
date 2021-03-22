###
# Diagnostic settings
###

resource "azurerm_monitor_diagnostic_setting" "sub_diag" {
  name                          = "sub_diag"
  target_resource_id            = data.azurerm_subscription.current.id
  log_analytics_workspace_id    = module.audit_logs.la_workspace_id
  depends_on                    = [module.audit_logs]

  log {
    category = "Administrative"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "Security"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "ServiceHealth"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "Alert"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "Recommendation"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "Policy"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "Autoscale"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "ResourceHealth"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

  

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days = 60
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "kv_diag" {
  name                          = "kv_diag"
  target_resource_id            = module.key_vault.id
  log_analytics_workspace_id    = module.audit_logs.la_workspace_id
  depends_on                    = [module.audit_logs]

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }


  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days = 60
    }
  }
}



resource "azurerm_monitor_diagnostic_setting" "rsv_diag" {
  name                          = "rsv_diag"
  target_resource_id            = module.recovery_services.id
  log_analytics_workspace_id    = module.audit_logs.la_workspace_id
  depends_on                    = [module.audit_logs]

  log {
    category = "AzureBackupReport"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "CoreAzureBackup"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AddonAzureBackupJobs"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AddonAzureBackupAlerts"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AddonAzureBackupPolicy"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AddonAzureBackupStorage"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AzureSiteRecoveryJobs"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AzureSiteRecoveryEvents"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = true

    retention_policy {
      enabled = true
      days = 60
    }
  
  }


  

}
