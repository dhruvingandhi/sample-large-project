# Antigravity modified: branch dg-3
# Model: model_038
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 038"

datagroup: model_038_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_038_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_038_default_datagroup

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

# Explores included in model model_038
explore: +explore_2961 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2962 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2963 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2964 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2965 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2966 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2967 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2968 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2969 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2970 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2971 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2972 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2973 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2974 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2975 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2976 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2977 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2978 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2979 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2980 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2981 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2982 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2983 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2984 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2985 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2986 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2987 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2988 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2989 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2990 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2991 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2992 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2993 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2994 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2995 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2996 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2997 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2998 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_2999 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3000 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3001 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3002 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3003 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3004 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3005 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3006 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3007 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3008 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3009 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3010 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3011 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3012 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3013 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3014 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3015 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3016 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3017 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3018 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3019 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3020 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3021 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3022 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3023 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3024 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3025 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3026 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3027 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3028 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3029 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3030 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3031 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3032 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3033 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3034 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3035 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3036 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3037 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3038 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3039 {
  persist_with: model_038_hourly_datagroup
}
explore: +explore_3040 {
  persist_with: model_038_hourly_datagroup
}
