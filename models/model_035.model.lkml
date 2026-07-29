# Model: model_035
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 035"

datagroup: model_035_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_035_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_035_default_datagroup

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

# Explores included in model model_035
explore: +explore_2721 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2722 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2723 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2724 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2725 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2726 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2727 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2728 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2729 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2730 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2731 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2732 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2733 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2734 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2735 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2736 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2737 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2738 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2739 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2740 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2741 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2742 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2743 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2744 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2745 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2746 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2747 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2748 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2749 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2750 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2751 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2752 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2753 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2754 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2755 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2756 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2757 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2758 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2759 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2760 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2761 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2762 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2763 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2764 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2765 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2766 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2767 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2768 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2769 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2770 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2771 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2772 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2773 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2774 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2775 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2776 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2777 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2778 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2779 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2780 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2781 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2782 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2783 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2784 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2785 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2786 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2787 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2788 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2789 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2790 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2791 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2792 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2793 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2794 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2795 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2796 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2797 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2798 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2799 {
  persist_with: model_035_hourly_datagroup
}
explore: +explore_2800 {
  persist_with: model_035_hourly_datagroup
}
