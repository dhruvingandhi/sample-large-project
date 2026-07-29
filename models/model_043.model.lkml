# Model: model_043
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 043"

datagroup: model_043_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_043_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_043_default_datagroup

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

# Explores included in model model_043
explore: +explore_3361 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3362 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3363 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3364 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3365 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3366 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3367 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3368 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3369 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3370 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3371 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3372 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3373 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3374 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3375 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3376 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3377 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3378 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3379 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3380 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3381 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3382 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3383 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3384 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3385 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3386 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3387 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3388 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3389 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3390 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3391 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3392 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3393 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3394 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3395 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3396 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3397 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3398 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3399 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3400 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3401 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3402 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3403 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3404 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3405 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3406 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3407 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3408 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3409 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3410 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3411 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3412 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3413 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3414 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3415 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3416 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3417 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3418 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3419 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3420 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3421 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3422 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3423 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3424 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3425 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3426 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3427 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3428 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3429 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3430 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3431 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3432 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3433 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3434 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3435 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3436 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3437 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3438 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3439 {
  persist_with: model_043_hourly_datagroup
}
explore: +explore_3440 {
  persist_with: model_043_hourly_datagroup
}
