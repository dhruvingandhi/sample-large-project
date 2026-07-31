# Update for 500 file diff target
# Model: model_039
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 039"

datagroup: model_039_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_039_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_039_default_datagroup

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

# Explores included in model model_039
explore: +explore_3041 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3042 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3043 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3044 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3045 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3046 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3047 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3048 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3049 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3050 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3051 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3052 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3053 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3054 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3055 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3056 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3057 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3058 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3059 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3060 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3061 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3062 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3063 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3064 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3065 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3066 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3067 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3068 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3069 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3070 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3071 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3072 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3073 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3074 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3075 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3076 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3077 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3078 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3079 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3080 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3081 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3082 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3083 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3084 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3085 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3086 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3087 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3088 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3089 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3090 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3091 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3092 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3093 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3094 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3095 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3096 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3097 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3098 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3099 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3100 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3101 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3102 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3103 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3104 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3105 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3106 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3107 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3108 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3109 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3110 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3111 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3112 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3113 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3114 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3115 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3116 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3117 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3118 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3119 {
  persist_with: model_039_hourly_datagroup
}
explore: +explore_3120 {
  persist_with: model_039_hourly_datagroup
}
