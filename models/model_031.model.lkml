# Model: model_031
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 031"

datagroup: model_031_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_031_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_031_default_datagroup

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

# Explores included in model model_031
explore: +explore_2401 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2402 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2403 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2404 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2405 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2406 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2407 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2408 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2409 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2410 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2411 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2412 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2413 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2414 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2415 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2416 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2417 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2418 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2419 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2420 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2421 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2422 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2423 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2424 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2425 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2426 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2427 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2428 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2429 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2430 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2431 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2432 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2433 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2434 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2435 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2436 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2437 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2438 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2439 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2440 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2441 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2442 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2443 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2444 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2445 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2446 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2447 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2448 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2449 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2450 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2451 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2452 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2453 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2454 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2455 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2456 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2457 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2458 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2459 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2460 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2461 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2462 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2463 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2464 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2465 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2466 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2467 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2468 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2469 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2470 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2471 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2472 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2473 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2474 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2475 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2476 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2477 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2478 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2479 {
  persist_with: model_031_hourly_datagroup
}
explore: +explore_2480 {
  persist_with: model_031_hourly_datagroup
}
