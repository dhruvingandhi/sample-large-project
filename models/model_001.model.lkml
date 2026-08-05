# Modified by Antigravity AI
# Antigravity modified: branch dg-3
# Model: model_001
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 001"

datagroup: model_001_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_001_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_001_default_datagroup

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

# Explores included in model model_001
explore: +explore_0001 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0002 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0003 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0004 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0005 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0006 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0007 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0008 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0009 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0010 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0011 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0012 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0013 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0014 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0015 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0016 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0017 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0018 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0019 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0020 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0021 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0022 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0023 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0024 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0025 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0026 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0027 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0028 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0029 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0030 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0031 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0032 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0033 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0034 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0035 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0036 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0037 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0038 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0039 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0040 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0041 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0042 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0043 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0044 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0045 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0046 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0047 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0048 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0049 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0050 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0051 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0052 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0053 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0054 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0055 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0056 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0057 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0058 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0059 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0060 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0061 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0062 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0063 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0064 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0065 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0066 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0067 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0068 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0069 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0070 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0071 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0072 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0073 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0074 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0075 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0076 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0077 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0078 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0079 {
  persist_with: model_001_hourly_datagroup
}
explore: +explore_0080 {
  persist_with: model_001_hourly_datagroup
}
