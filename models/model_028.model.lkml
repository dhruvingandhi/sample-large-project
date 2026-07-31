# Antigravity modified: branch dg-3
# Model: model_028
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 028"

datagroup: model_028_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_028_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_028_default_datagroup

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

# Explores included in model model_028
explore: +explore_2161 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2162 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2163 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2164 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2165 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2166 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2167 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2168 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2169 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2170 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2171 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2172 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2173 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2174 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2175 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2176 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2177 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2178 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2179 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2180 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2181 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2182 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2183 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2184 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2185 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2186 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2187 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2188 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2189 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2190 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2191 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2192 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2193 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2194 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2195 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2196 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2197 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2198 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2199 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2200 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2201 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2202 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2203 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2204 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2205 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2206 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2207 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2208 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2209 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2210 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2211 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2212 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2213 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2214 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2215 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2216 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2217 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2218 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2219 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2220 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2221 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2222 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2223 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2224 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2225 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2226 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2227 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2228 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2229 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2230 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2231 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2232 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2233 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2234 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2235 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2236 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2237 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2238 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2239 {
  persist_with: model_028_hourly_datagroup
}
explore: +explore_2240 {
  persist_with: model_028_hourly_datagroup
}
