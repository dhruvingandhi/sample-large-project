# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_002
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 002"

datagroup: model_002_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_002_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_002_default_datagroup

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

# Explores included in model model_002
explore: +explore_0081 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0082 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0083 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0084 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0085 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0086 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0087 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0088 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0089 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0090 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0091 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0092 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0093 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0094 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0095 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0096 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0097 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0098 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0099 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0100 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0101 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0102 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0103 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0104 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0105 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0106 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0107 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0108 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0109 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0110 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0111 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0112 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0113 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0114 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0115 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0116 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0117 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0118 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0119 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0120 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0121 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0122 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0123 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0124 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0125 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0126 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0127 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0128 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0129 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0130 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0131 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0132 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0133 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0134 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0135 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0136 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0137 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0138 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0139 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0140 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0141 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0142 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0143 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0144 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0145 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0146 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0147 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0148 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0149 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0150 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0151 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0152 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0153 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0154 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0155 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0156 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0157 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0158 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0159 {
  persist_with: model_002_hourly_datagroup
}
explore: +explore_0160 {
  persist_with: model_002_hourly_datagroup
}
