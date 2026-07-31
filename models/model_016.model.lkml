# Antigravity modified: branch dg-3
# Model: model_016
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 016"

datagroup: model_016_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_016_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_016_default_datagroup

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

# Explores included in model model_016
explore: +explore_1201 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1202 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1203 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1204 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1205 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1206 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1207 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1208 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1209 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1210 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1211 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1212 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1213 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1214 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1215 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1216 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1217 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1218 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1219 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1220 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1221 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1222 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1223 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1224 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1225 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1226 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1227 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1228 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1229 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1230 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1231 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1232 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1233 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1234 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1235 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1236 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1237 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1238 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1239 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1240 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1241 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1242 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1243 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1244 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1245 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1246 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1247 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1248 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1249 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1250 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1251 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1252 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1253 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1254 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1255 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1256 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1257 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1258 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1259 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1260 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1261 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1262 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1263 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1264 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1265 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1266 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1267 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1268 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1269 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1270 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1271 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1272 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1273 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1274 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1275 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1276 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1277 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1278 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1279 {
  persist_with: model_016_hourly_datagroup
}
explore: +explore_1280 {
  persist_with: model_016_hourly_datagroup
}
