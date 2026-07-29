# Model: model_008
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 008"

datagroup: model_008_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_008_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_008_default_datagroup

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

# Explores included in model model_008
explore: +explore_0561 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0562 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0563 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0564 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0565 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0566 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0567 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0568 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0569 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0570 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0571 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0572 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0573 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0574 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0575 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0576 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0577 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0578 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0579 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0580 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0581 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0582 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0583 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0584 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0585 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0586 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0587 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0588 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0589 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0590 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0591 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0592 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0593 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0594 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0595 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0596 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0597 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0598 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0599 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0600 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0601 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0602 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0603 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0604 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0605 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0606 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0607 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0608 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0609 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0610 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0611 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0612 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0613 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0614 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0615 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0616 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0617 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0618 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0619 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0620 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0621 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0622 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0623 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0624 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0625 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0626 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0627 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0628 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0629 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0630 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0631 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0632 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0633 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0634 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0635 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0636 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0637 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0638 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0639 {
  persist_with: model_008_hourly_datagroup
}
explore: +explore_0640 {
  persist_with: model_008_hourly_datagroup
}
