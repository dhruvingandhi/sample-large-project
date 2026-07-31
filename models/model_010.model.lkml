# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_010
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 010"

datagroup: model_010_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_010_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_010_default_datagroup

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

# Explores included in model model_010
explore: +explore_0721 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0722 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0723 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0724 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0725 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0726 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0727 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0728 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0729 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0730 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0731 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0732 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0733 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0734 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0735 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0736 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0737 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0738 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0739 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0740 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0741 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0742 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0743 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0744 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0745 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0746 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0747 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0748 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0749 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0750 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0751 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0752 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0753 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0754 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0755 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0756 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0757 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0758 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0759 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0760 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0761 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0762 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0763 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0764 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0765 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0766 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0767 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0768 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0769 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0770 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0771 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0772 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0773 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0774 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0775 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0776 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0777 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0778 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0779 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0780 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0781 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0782 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0783 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0784 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0785 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0786 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0787 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0788 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0789 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0790 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0791 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0792 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0793 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0794 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0795 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0796 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0797 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0798 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0799 {
  persist_with: model_010_hourly_datagroup
}
explore: +explore_0800 {
  persist_with: model_010_hourly_datagroup
}
