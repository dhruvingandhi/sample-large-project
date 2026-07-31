# Antigravity modified: branch dg-3
# Model: model_041
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 041"

datagroup: model_041_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_041_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_041_default_datagroup

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

# Explores included in model model_041
explore: +explore_3201 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3202 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3203 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3204 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3205 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3206 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3207 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3208 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3209 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3210 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3211 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3212 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3213 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3214 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3215 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3216 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3217 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3218 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3219 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3220 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3221 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3222 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3223 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3224 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3225 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3226 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3227 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3228 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3229 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3230 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3231 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3232 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3233 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3234 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3235 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3236 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3237 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3238 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3239 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3240 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3241 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3242 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3243 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3244 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3245 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3246 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3247 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3248 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3249 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3250 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3251 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3252 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3253 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3254 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3255 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3256 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3257 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3258 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3259 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3260 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3261 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3262 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3263 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3264 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3265 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3266 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3267 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3268 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3269 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3270 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3271 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3272 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3273 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3274 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3275 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3276 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3277 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3278 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3279 {
  persist_with: model_041_hourly_datagroup
}
explore: +explore_3280 {
  persist_with: model_041_hourly_datagroup
}
