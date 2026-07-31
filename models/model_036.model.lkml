# Update for 500 file diff target
# Model: model_036
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 036"

datagroup: model_036_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_036_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_036_default_datagroup

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

# Explores included in model model_036
explore: +explore_2801 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2802 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2803 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2804 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2805 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2806 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2807 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2808 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2809 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2810 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2811 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2812 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2813 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2814 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2815 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2816 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2817 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2818 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2819 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2820 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2821 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2822 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2823 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2824 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2825 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2826 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2827 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2828 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2829 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2830 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2831 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2832 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2833 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2834 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2835 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2836 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2837 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2838 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2839 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2840 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2841 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2842 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2843 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2844 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2845 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2846 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2847 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2848 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2849 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2850 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2851 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2852 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2853 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2854 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2855 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2856 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2857 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2858 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2859 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2860 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2861 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2862 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2863 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2864 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2865 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2866 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2867 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2868 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2869 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2870 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2871 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2872 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2873 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2874 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2875 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2876 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2877 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2878 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2879 {
  persist_with: model_036_hourly_datagroup
}
explore: +explore_2880 {
  persist_with: model_036_hourly_datagroup
}
