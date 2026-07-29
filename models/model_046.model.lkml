# Model: model_046
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 046"

datagroup: model_046_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_046_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_046_default_datagroup

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

# Explores included in model model_046
explore: +explore_3601 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3602 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3603 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3604 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3605 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3606 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3607 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3608 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3609 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3610 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3611 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3612 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3613 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3614 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3615 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3616 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3617 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3618 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3619 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3620 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3621 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3622 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3623 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3624 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3625 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3626 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3627 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3628 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3629 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3630 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3631 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3632 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3633 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3634 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3635 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3636 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3637 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3638 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3639 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3640 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3641 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3642 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3643 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3644 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3645 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3646 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3647 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3648 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3649 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3650 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3651 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3652 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3653 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3654 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3655 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3656 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3657 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3658 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3659 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3660 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3661 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3662 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3663 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3664 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3665 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3666 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3667 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3668 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3669 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3670 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3671 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3672 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3673 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3674 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3675 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3676 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3677 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3678 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3679 {
  persist_with: model_046_hourly_datagroup
}
explore: +explore_3680 {
  persist_with: model_046_hourly_datagroup
}
