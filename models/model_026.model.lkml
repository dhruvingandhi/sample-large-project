# Modified by Antigravity AI
# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_026
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 026"

datagroup: model_026_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_026_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_026_default_datagroup

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

# Explores included in model model_026
explore: +explore_2001 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2002 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2003 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2004 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2005 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2006 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2007 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2008 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2009 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2010 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2011 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2012 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2013 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2014 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2015 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2016 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2017 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2018 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2019 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2020 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2021 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2022 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2023 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2024 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2025 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2026 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2027 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2028 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2029 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2030 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2031 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2032 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2033 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2034 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2035 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2036 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2037 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2038 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2039 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2040 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2041 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2042 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2043 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2044 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2045 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2046 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2047 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2048 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2049 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2050 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2051 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2052 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2053 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2054 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2055 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2056 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2057 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2058 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2059 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2060 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2061 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2062 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2063 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2064 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2065 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2066 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2067 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2068 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2069 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2070 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2071 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2072 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2073 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2074 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2075 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2076 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2077 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2078 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2079 {
  persist_with: model_026_hourly_datagroup
}
explore: +explore_2080 {
  persist_with: model_026_hourly_datagroup
}
