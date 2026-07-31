# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_018
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 018"

datagroup: model_018_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_018_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_018_default_datagroup

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

# Explores included in model model_018
explore: +explore_1361 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1362 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1363 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1364 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1365 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1366 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1367 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1368 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1369 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1370 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1371 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1372 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1373 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1374 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1375 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1376 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1377 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1378 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1379 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1380 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1381 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1382 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1383 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1384 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1385 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1386 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1387 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1388 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1389 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1390 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1391 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1392 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1393 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1394 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1395 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1396 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1397 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1398 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1399 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1400 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1401 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1402 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1403 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1404 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1405 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1406 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1407 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1408 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1409 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1410 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1411 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1412 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1413 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1414 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1415 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1416 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1417 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1418 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1419 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1420 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1421 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1422 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1423 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1424 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1425 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1426 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1427 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1428 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1429 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1430 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1431 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1432 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1433 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1434 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1435 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1436 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1437 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1438 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1439 {
  persist_with: model_018_hourly_datagroup
}
explore: +explore_1440 {
  persist_with: model_018_hourly_datagroup
}
