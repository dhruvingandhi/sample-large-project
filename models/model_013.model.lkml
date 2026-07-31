# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_013
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 013"

datagroup: model_013_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_013_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_013_default_datagroup

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

# Explores included in model model_013
explore: +explore_0961 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0962 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0963 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0964 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0965 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0966 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0967 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0968 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0969 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0970 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0971 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0972 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0973 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0974 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0975 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0976 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0977 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0978 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0979 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0980 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0981 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0982 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0983 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0984 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0985 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0986 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0987 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0988 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0989 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0990 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0991 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0992 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0993 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0994 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0995 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0996 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0997 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0998 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_0999 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1000 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1001 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1002 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1003 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1004 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1005 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1006 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1007 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1008 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1009 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1010 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1011 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1012 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1013 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1014 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1015 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1016 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1017 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1018 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1019 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1020 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1021 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1022 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1023 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1024 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1025 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1026 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1027 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1028 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1029 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1030 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1031 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1032 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1033 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1034 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1035 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1036 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1037 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1038 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1039 {
  persist_with: model_013_hourly_datagroup
}
explore: +explore_1040 {
  persist_with: model_013_hourly_datagroup
}
