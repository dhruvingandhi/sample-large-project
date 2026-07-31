# Antigravity modified: branch dg-3
# Model: model_045
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 045"

datagroup: model_045_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_045_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_045_default_datagroup

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

# Explores included in model model_045
explore: +explore_3521 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3522 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3523 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3524 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3525 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3526 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3527 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3528 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3529 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3530 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3531 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3532 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3533 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3534 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3535 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3536 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3537 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3538 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3539 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3540 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3541 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3542 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3543 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3544 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3545 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3546 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3547 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3548 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3549 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3550 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3551 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3552 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3553 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3554 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3555 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3556 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3557 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3558 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3559 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3560 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3561 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3562 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3563 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3564 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3565 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3566 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3567 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3568 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3569 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3570 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3571 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3572 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3573 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3574 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3575 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3576 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3577 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3578 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3579 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3580 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3581 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3582 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3583 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3584 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3585 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3586 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3587 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3588 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3589 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3590 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3591 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3592 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3593 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3594 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3595 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3596 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3597 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3598 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3599 {
  persist_with: model_045_hourly_datagroup
}
explore: +explore_3600 {
  persist_with: model_045_hourly_datagroup
}
