# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_033
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 033"

datagroup: model_033_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_033_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_033_default_datagroup

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

# Explores included in model model_033
explore: +explore_2561 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2562 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2563 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2564 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2565 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2566 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2567 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2568 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2569 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2570 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2571 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2572 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2573 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2574 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2575 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2576 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2577 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2578 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2579 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2580 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2581 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2582 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2583 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2584 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2585 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2586 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2587 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2588 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2589 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2590 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2591 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2592 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2593 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2594 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2595 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2596 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2597 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2598 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2599 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2600 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2601 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2602 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2603 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2604 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2605 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2606 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2607 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2608 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2609 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2610 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2611 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2612 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2613 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2614 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2615 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2616 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2617 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2618 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2619 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2620 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2621 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2622 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2623 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2624 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2625 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2626 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2627 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2628 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2629 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2630 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2631 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2632 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2633 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2634 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2635 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2636 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2637 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2638 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2639 {
  persist_with: model_033_hourly_datagroup
}
explore: +explore_2640 {
  persist_with: model_033_hourly_datagroup
}
