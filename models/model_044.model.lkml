# Modified by Antigravity AI
# Antigravity modified: branch dg-3
# Model: model_044
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 044"

datagroup: model_044_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_044_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_044_default_datagroup

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

# Explores included in model model_044
explore: +explore_3441 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3442 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3443 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3444 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3445 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3446 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3447 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3448 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3449 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3450 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3451 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3452 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3453 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3454 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3455 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3456 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3457 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3458 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3459 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3460 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3461 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3462 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3463 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3464 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3465 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3466 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3467 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3468 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3469 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3470 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3471 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3472 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3473 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3474 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3475 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3476 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3477 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3478 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3479 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3480 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3481 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3482 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3483 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3484 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3485 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3486 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3487 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3488 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3489 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3490 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3491 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3492 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3493 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3494 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3495 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3496 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3497 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3498 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3499 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3500 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3501 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3502 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3503 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3504 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3505 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3506 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3507 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3508 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3509 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3510 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3511 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3512 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3513 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3514 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3515 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3516 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3517 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3518 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3519 {
  persist_with: model_044_hourly_datagroup
}
explore: +explore_3520 {
  persist_with: model_044_hourly_datagroup
}
