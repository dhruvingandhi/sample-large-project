# Modified by Antigravity AI
# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_009
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 009"

datagroup: model_009_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_009_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_009_default_datagroup

named_value_format: usd_custom {
  format_name: "$#,##0.00;($#,##0.00);"-""
}

named_value_format: percentage_custom {
  format_name: "0.00%"
}

access_grant: see_sensitive_financials {
  user_attribute: department
  allowed_values: ["finance", "executive", "audit"]
}

access_grant: see_pii_data {
  user_attribute: security_clearance
  allowed_values: ["tier_3", "admin"]
}

# Explores included in model model_009
explore: +explore_0641 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0642 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0643 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0644 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0645 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0646 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0647 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0648 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0649 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0650 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0651 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0652 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0653 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0654 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0655 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0656 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0657 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0658 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0659 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0660 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0661 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0662 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0663 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0664 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0665 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0666 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0667 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0668 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0669 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0670 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0671 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0672 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0673 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0674 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0675 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0676 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0677 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0678 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0679 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0680 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0681 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0682 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0683 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0684 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0685 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0686 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0687 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0688 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0689 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0690 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0691 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0692 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0693 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0694 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0695 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0696 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0697 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0698 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0699 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0700 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0701 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0702 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0703 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0704 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0705 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0706 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0707 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0708 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0709 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0710 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0711 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0712 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0713 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0714 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0715 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0716 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0717 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0718 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0719 {
  persist_with: model_009_hourly_datagroup
}
explore: +explore_0720 {
  persist_with: model_009_hourly_datagroup
}
