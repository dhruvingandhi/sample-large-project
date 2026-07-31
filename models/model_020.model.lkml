# Antigravity modified: branch dg-3
# Model: model_020
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 020"

datagroup: model_020_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_020_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_020_default_datagroup

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

# Explores included in model model_020
explore: +explore_1521 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1522 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1523 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1524 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1525 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1526 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1527 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1528 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1529 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1530 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1531 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1532 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1533 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1534 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1535 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1536 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1537 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1538 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1539 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1540 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1541 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1542 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1543 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1544 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1545 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1546 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1547 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1548 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1549 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1550 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1551 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1552 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1553 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1554 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1555 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1556 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1557 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1558 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1559 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1560 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1561 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1562 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1563 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1564 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1565 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1566 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1567 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1568 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1569 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1570 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1571 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1572 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1573 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1574 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1575 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1576 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1577 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1578 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1579 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1580 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1581 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1582 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1583 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1584 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1585 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1586 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1587 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1588 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1589 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1590 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1591 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1592 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1593 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1594 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1595 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1596 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1597 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1598 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1599 {
  persist_with: model_020_hourly_datagroup
}
explore: +explore_1600 {
  persist_with: model_020_hourly_datagroup
}
