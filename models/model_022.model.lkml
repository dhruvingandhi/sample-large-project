# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_022
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 022"

datagroup: model_022_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_022_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_022_default_datagroup

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

# Explores included in model model_022
explore: +explore_1681 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1682 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1683 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1684 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1685 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1686 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1687 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1688 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1689 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1690 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1691 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1692 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1693 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1694 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1695 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1696 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1697 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1698 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1699 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1700 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1701 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1702 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1703 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1704 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1705 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1706 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1707 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1708 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1709 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1710 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1711 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1712 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1713 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1714 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1715 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1716 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1717 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1718 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1719 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1720 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1721 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1722 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1723 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1724 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1725 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1726 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1727 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1728 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1729 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1730 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1731 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1732 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1733 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1734 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1735 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1736 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1737 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1738 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1739 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1740 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1741 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1742 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1743 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1744 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1745 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1746 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1747 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1748 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1749 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1750 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1751 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1752 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1753 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1754 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1755 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1756 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1757 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1758 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1759 {
  persist_with: model_022_hourly_datagroup
}
explore: +explore_1760 {
  persist_with: model_022_hourly_datagroup
}
