# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_011
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 011"

datagroup: model_011_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_011_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_011_default_datagroup

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

# Explores included in model model_011
explore: +explore_0801 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0802 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0803 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0804 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0805 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0806 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0807 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0808 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0809 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0810 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0811 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0812 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0813 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0814 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0815 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0816 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0817 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0818 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0819 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0820 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0821 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0822 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0823 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0824 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0825 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0826 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0827 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0828 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0829 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0830 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0831 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0832 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0833 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0834 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0835 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0836 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0837 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0838 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0839 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0840 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0841 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0842 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0843 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0844 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0845 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0846 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0847 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0848 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0849 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0850 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0851 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0852 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0853 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0854 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0855 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0856 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0857 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0858 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0859 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0860 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0861 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0862 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0863 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0864 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0865 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0866 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0867 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0868 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0869 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0870 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0871 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0872 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0873 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0874 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0875 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0876 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0877 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0878 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0879 {
  persist_with: model_011_hourly_datagroup
}
explore: +explore_0880 {
  persist_with: model_011_hourly_datagroup
}
