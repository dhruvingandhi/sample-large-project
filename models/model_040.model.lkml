# Antigravity modified: branch dg-3
# Model: model_040
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 040"

datagroup: model_040_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_040_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_040_default_datagroup

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

# Explores included in model model_040
explore: +explore_3121 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3122 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3123 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3124 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3125 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3126 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3127 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3128 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3129 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3130 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3131 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3132 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3133 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3134 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3135 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3136 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3137 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3138 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3139 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3140 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3141 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3142 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3143 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3144 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3145 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3146 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3147 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3148 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3149 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3150 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3151 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3152 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3153 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3154 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3155 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3156 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3157 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3158 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3159 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3160 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3161 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3162 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3163 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3164 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3165 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3166 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3167 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3168 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3169 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3170 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3171 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3172 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3173 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3174 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3175 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3176 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3177 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3178 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3179 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3180 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3181 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3182 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3183 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3184 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3185 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3186 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3187 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3188 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3189 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3190 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3191 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3192 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3193 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3194 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3195 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3196 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3197 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3198 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3199 {
  persist_with: model_040_hourly_datagroup
}
explore: +explore_3200 {
  persist_with: model_040_hourly_datagroup
}
