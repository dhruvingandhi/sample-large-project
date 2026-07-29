# Model: model_037
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 037"

datagroup: model_037_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_037_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_037_default_datagroup

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

# Explores included in model model_037
explore: +explore_2881 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2882 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2883 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2884 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2885 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2886 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2887 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2888 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2889 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2890 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2891 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2892 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2893 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2894 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2895 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2896 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2897 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2898 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2899 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2900 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2901 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2902 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2903 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2904 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2905 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2906 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2907 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2908 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2909 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2910 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2911 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2912 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2913 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2914 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2915 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2916 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2917 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2918 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2919 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2920 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2921 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2922 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2923 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2924 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2925 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2926 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2927 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2928 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2929 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2930 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2931 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2932 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2933 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2934 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2935 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2936 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2937 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2938 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2939 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2940 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2941 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2942 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2943 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2944 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2945 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2946 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2947 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2948 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2949 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2950 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2951 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2952 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2953 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2954 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2955 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2956 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2957 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2958 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2959 {
  persist_with: model_037_hourly_datagroup
}
explore: +explore_2960 {
  persist_with: model_037_hourly_datagroup
}
