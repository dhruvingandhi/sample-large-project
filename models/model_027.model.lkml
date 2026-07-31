# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_027
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 027"

datagroup: model_027_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_027_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_027_default_datagroup

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

# Explores included in model model_027
explore: +explore_2081 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2082 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2083 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2084 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2085 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2086 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2087 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2088 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2089 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2090 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2091 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2092 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2093 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2094 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2095 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2096 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2097 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2098 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2099 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2100 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2101 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2102 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2103 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2104 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2105 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2106 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2107 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2108 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2109 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2110 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2111 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2112 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2113 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2114 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2115 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2116 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2117 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2118 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2119 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2120 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2121 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2122 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2123 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2124 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2125 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2126 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2127 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2128 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2129 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2130 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2131 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2132 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2133 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2134 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2135 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2136 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2137 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2138 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2139 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2140 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2141 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2142 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2143 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2144 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2145 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2146 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2147 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2148 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2149 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2150 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2151 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2152 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2153 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2154 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2155 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2156 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2157 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2158 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2159 {
  persist_with: model_027_hourly_datagroup
}
explore: +explore_2160 {
  persist_with: model_027_hourly_datagroup
}
