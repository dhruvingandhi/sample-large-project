# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_014
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 014"

datagroup: model_014_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_014_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_014_default_datagroup

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

# Explores included in model model_014
explore: +explore_1041 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1042 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1043 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1044 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1045 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1046 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1047 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1048 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1049 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1050 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1051 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1052 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1053 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1054 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1055 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1056 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1057 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1058 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1059 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1060 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1061 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1062 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1063 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1064 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1065 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1066 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1067 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1068 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1069 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1070 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1071 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1072 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1073 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1074 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1075 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1076 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1077 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1078 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1079 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1080 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1081 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1082 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1083 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1084 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1085 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1086 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1087 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1088 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1089 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1090 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1091 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1092 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1093 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1094 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1095 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1096 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1097 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1098 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1099 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1100 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1101 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1102 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1103 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1104 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1105 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1106 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1107 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1108 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1109 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1110 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1111 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1112 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1113 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1114 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1115 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1116 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1117 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1118 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1119 {
  persist_with: model_014_hourly_datagroup
}
explore: +explore_1120 {
  persist_with: model_014_hourly_datagroup
}
