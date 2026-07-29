# Model: model_042
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 042"

datagroup: model_042_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_042_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_042_default_datagroup

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

# Explores included in model model_042
explore: +explore_3281 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3282 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3283 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3284 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3285 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3286 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3287 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3288 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3289 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3290 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3291 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3292 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3293 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3294 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3295 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3296 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3297 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3298 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3299 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3300 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3301 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3302 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3303 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3304 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3305 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3306 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3307 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3308 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3309 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3310 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3311 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3312 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3313 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3314 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3315 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3316 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3317 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3318 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3319 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3320 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3321 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3322 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3323 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3324 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3325 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3326 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3327 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3328 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3329 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3330 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3331 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3332 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3333 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3334 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3335 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3336 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3337 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3338 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3339 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3340 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3341 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3342 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3343 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3344 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3345 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3346 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3347 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3348 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3349 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3350 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3351 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3352 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3353 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3354 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3355 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3356 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3357 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3358 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3359 {
  persist_with: model_042_hourly_datagroup
}
explore: +explore_3360 {
  persist_with: model_042_hourly_datagroup
}
