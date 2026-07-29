# Model: model_032
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 032"

datagroup: model_032_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_032_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_032_default_datagroup

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

# Explores included in model model_032
explore: +explore_2481 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2482 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2483 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2484 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2485 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2486 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2487 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2488 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2489 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2490 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2491 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2492 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2493 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2494 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2495 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2496 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2497 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2498 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2499 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2500 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2501 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2502 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2503 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2504 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2505 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2506 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2507 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2508 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2509 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2510 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2511 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2512 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2513 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2514 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2515 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2516 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2517 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2518 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2519 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2520 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2521 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2522 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2523 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2524 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2525 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2526 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2527 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2528 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2529 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2530 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2531 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2532 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2533 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2534 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2535 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2536 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2537 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2538 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2539 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2540 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2541 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2542 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2543 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2544 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2545 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2546 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2547 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2548 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2549 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2550 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2551 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2552 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2553 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2554 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2555 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2556 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2557 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2558 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2559 {
  persist_with: model_032_hourly_datagroup
}
explore: +explore_2560 {
  persist_with: model_032_hourly_datagroup
}
