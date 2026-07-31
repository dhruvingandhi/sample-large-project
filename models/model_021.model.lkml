# Antigravity modified: branch dg-3
# Model: model_021
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 021"

datagroup: model_021_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_021_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_021_default_datagroup

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

# Explores included in model model_021
explore: +explore_1601 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1602 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1603 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1604 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1605 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1606 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1607 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1608 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1609 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1610 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1611 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1612 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1613 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1614 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1615 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1616 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1617 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1618 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1619 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1620 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1621 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1622 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1623 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1624 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1625 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1626 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1627 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1628 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1629 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1630 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1631 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1632 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1633 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1634 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1635 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1636 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1637 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1638 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1639 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1640 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1641 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1642 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1643 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1644 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1645 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1646 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1647 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1648 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1649 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1650 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1651 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1652 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1653 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1654 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1655 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1656 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1657 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1658 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1659 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1660 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1661 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1662 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1663 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1664 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1665 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1666 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1667 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1668 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1669 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1670 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1671 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1672 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1673 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1674 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1675 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1676 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1677 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1678 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1679 {
  persist_with: model_021_hourly_datagroup
}
explore: +explore_1680 {
  persist_with: model_021_hourly_datagroup
}
