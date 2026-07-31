# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_030
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 030"

datagroup: model_030_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_030_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_030_default_datagroup

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

# Explores included in model model_030
explore: +explore_2321 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2322 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2323 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2324 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2325 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2326 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2327 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2328 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2329 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2330 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2331 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2332 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2333 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2334 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2335 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2336 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2337 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2338 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2339 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2340 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2341 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2342 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2343 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2344 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2345 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2346 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2347 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2348 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2349 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2350 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2351 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2352 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2353 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2354 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2355 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2356 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2357 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2358 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2359 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2360 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2361 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2362 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2363 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2364 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2365 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2366 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2367 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2368 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2369 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2370 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2371 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2372 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2373 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2374 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2375 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2376 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2377 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2378 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2379 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2380 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2381 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2382 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2383 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2384 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2385 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2386 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2387 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2388 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2389 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2390 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2391 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2392 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2393 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2394 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2395 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2396 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2397 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2398 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2399 {
  persist_with: model_030_hourly_datagroup
}
explore: +explore_2400 {
  persist_with: model_030_hourly_datagroup
}
