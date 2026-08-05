# Modified by Antigravity AI
# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_007
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 007"

datagroup: model_007_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_007_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_007_default_datagroup

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

# Explores included in model model_007
explore: +explore_0481 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0482 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0483 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0484 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0485 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0486 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0487 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0488 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0489 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0490 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0491 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0492 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0493 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0494 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0495 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0496 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0497 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0498 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0499 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0500 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0501 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0502 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0503 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0504 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0505 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0506 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0507 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0508 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0509 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0510 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0511 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0512 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0513 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0514 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0515 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0516 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0517 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0518 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0519 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0520 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0521 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0522 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0523 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0524 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0525 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0526 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0527 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0528 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0529 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0530 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0531 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0532 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0533 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0534 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0535 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0536 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0537 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0538 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0539 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0540 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0541 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0542 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0543 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0544 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0545 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0546 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0547 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0548 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0549 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0550 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0551 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0552 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0553 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0554 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0555 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0556 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0557 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0558 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0559 {
  persist_with: model_007_hourly_datagroup
}
explore: +explore_0560 {
  persist_with: model_007_hourly_datagroup
}
