# Modified by Antigravity AI
# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_023
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 023"

datagroup: model_023_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_023_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_023_default_datagroup

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

# Explores included in model model_023
explore: +explore_1761 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1762 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1763 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1764 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1765 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1766 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1767 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1768 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1769 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1770 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1771 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1772 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1773 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1774 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1775 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1776 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1777 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1778 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1779 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1780 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1781 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1782 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1783 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1784 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1785 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1786 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1787 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1788 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1789 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1790 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1791 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1792 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1793 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1794 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1795 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1796 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1797 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1798 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1799 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1800 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1801 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1802 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1803 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1804 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1805 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1806 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1807 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1808 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1809 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1810 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1811 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1812 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1813 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1814 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1815 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1816 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1817 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1818 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1819 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1820 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1821 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1822 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1823 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1824 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1825 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1826 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1827 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1828 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1829 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1830 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1831 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1832 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1833 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1834 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1835 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1836 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1837 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1838 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1839 {
  persist_with: model_023_hourly_datagroup
}
explore: +explore_1840 {
  persist_with: model_023_hourly_datagroup
}
