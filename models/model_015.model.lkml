# Antigravity modified: branch dg-3
# Model: model_015
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 015"

datagroup: model_015_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_015_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_015_default_datagroup

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

# Explores included in model model_015
explore: +explore_1121 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1122 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1123 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1124 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1125 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1126 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1127 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1128 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1129 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1130 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1131 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1132 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1133 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1134 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1135 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1136 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1137 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1138 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1139 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1140 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1141 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1142 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1143 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1144 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1145 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1146 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1147 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1148 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1149 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1150 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1151 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1152 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1153 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1154 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1155 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1156 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1157 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1158 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1159 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1160 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1161 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1162 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1163 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1164 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1165 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1166 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1167 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1168 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1169 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1170 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1171 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1172 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1173 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1174 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1175 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1176 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1177 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1178 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1179 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1180 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1181 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1182 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1183 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1184 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1185 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1186 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1187 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1188 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1189 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1190 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1191 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1192 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1193 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1194 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1195 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1196 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1197 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1198 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1199 {
  persist_with: model_015_hourly_datagroup
}
explore: +explore_1200 {
  persist_with: model_015_hourly_datagroup
}
