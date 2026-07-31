# Antigravity modified: branch dg-3
# Model: model_024
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 024"

datagroup: model_024_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_024_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_024_default_datagroup

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

# Explores included in model model_024
explore: +explore_1841 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1842 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1843 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1844 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1845 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1846 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1847 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1848 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1849 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1850 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1851 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1852 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1853 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1854 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1855 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1856 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1857 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1858 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1859 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1860 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1861 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1862 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1863 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1864 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1865 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1866 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1867 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1868 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1869 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1870 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1871 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1872 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1873 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1874 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1875 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1876 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1877 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1878 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1879 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1880 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1881 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1882 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1883 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1884 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1885 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1886 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1887 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1888 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1889 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1890 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1891 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1892 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1893 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1894 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1895 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1896 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1897 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1898 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1899 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1900 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1901 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1902 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1903 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1904 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1905 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1906 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1907 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1908 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1909 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1910 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1911 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1912 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1913 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1914 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1915 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1916 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1917 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1918 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1919 {
  persist_with: model_024_hourly_datagroup
}
explore: +explore_1920 {
  persist_with: model_024_hourly_datagroup
}
