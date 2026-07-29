# Model: model_029
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 029"

datagroup: model_029_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_029_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_029_default_datagroup

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

# Explores included in model model_029
explore: +explore_2241 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2242 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2243 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2244 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2245 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2246 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2247 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2248 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2249 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2250 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2251 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2252 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2253 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2254 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2255 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2256 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2257 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2258 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2259 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2260 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2261 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2262 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2263 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2264 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2265 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2266 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2267 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2268 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2269 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2270 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2271 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2272 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2273 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2274 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2275 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2276 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2277 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2278 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2279 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2280 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2281 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2282 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2283 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2284 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2285 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2286 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2287 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2288 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2289 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2290 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2291 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2292 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2293 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2294 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2295 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2296 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2297 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2298 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2299 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2300 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2301 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2302 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2303 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2304 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2305 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2306 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2307 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2308 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2309 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2310 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2311 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2312 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2313 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2314 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2315 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2316 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2317 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2318 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2319 {
  persist_with: model_029_hourly_datagroup
}
explore: +explore_2320 {
  persist_with: model_029_hourly_datagroup
}
