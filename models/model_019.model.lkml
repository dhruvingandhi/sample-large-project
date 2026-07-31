# Antigravity modified: branch dg-3
# Model: model_019
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 019"

datagroup: model_019_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_019_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_019_default_datagroup

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

# Explores included in model model_019
explore: +explore_1441 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1442 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1443 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1444 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1445 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1446 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1447 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1448 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1449 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1450 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1451 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1452 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1453 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1454 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1455 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1456 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1457 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1458 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1459 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1460 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1461 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1462 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1463 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1464 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1465 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1466 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1467 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1468 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1469 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1470 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1471 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1472 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1473 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1474 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1475 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1476 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1477 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1478 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1479 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1480 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1481 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1482 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1483 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1484 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1485 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1486 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1487 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1488 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1489 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1490 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1491 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1492 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1493 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1494 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1495 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1496 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1497 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1498 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1499 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1500 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1501 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1502 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1503 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1504 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1505 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1506 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1507 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1508 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1509 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1510 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1511 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1512 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1513 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1514 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1515 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1516 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1517 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1518 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1519 {
  persist_with: model_019_hourly_datagroup
}
explore: +explore_1520 {
  persist_with: model_019_hourly_datagroup
}
