# Antigravity modified: branch dg-3
# Model: model_034
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 034"

datagroup: model_034_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_034_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_034_default_datagroup

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

# Explores included in model model_034
explore: +explore_2641 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2642 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2643 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2644 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2645 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2646 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2647 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2648 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2649 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2650 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2651 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2652 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2653 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2654 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2655 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2656 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2657 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2658 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2659 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2660 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2661 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2662 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2663 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2664 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2665 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2666 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2667 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2668 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2669 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2670 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2671 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2672 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2673 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2674 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2675 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2676 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2677 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2678 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2679 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2680 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2681 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2682 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2683 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2684 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2685 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2686 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2687 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2688 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2689 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2690 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2691 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2692 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2693 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2694 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2695 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2696 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2697 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2698 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2699 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2700 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2701 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2702 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2703 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2704 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2705 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2706 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2707 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2708 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2709 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2710 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2711 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2712 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2713 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2714 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2715 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2716 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2717 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2718 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2719 {
  persist_with: model_034_hourly_datagroup
}
explore: +explore_2720 {
  persist_with: model_034_hourly_datagroup
}
