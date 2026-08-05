# Modified by Antigravity AI
# Antigravity modified: branch dg-3
# Model: model_017
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 017"

datagroup: model_017_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_017_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_017_default_datagroup

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

# Explores included in model model_017
explore: +explore_1281 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1282 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1283 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1284 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1285 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1286 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1287 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1288 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1289 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1290 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1291 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1292 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1293 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1294 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1295 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1296 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1297 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1298 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1299 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1300 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1301 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1302 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1303 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1304 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1305 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1306 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1307 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1308 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1309 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1310 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1311 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1312 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1313 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1314 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1315 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1316 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1317 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1318 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1319 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1320 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1321 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1322 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1323 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1324 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1325 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1326 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1327 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1328 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1329 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1330 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1331 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1332 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1333 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1334 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1335 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1336 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1337 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1338 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1339 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1340 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1341 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1342 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1343 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1344 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1345 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1346 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1347 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1348 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1349 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1350 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1351 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1352 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1353 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1354 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1355 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1356 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1357 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1358 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1359 {
  persist_with: model_017_hourly_datagroup
}
explore: +explore_1360 {
  persist_with: model_017_hourly_datagroup
}
