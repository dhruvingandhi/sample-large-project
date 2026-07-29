# Model: model_047
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 047"

datagroup: model_047_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_047_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_047_default_datagroup

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

# Explores included in model model_047
explore: +explore_3681 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3682 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3683 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3684 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3685 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3686 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3687 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3688 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3689 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3690 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3691 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3692 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3693 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3694 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3695 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3696 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3697 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3698 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3699 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3700 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3701 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3702 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3703 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3704 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3705 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3706 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3707 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3708 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3709 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3710 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3711 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3712 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3713 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3714 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3715 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3716 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3717 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3718 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3719 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3720 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3721 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3722 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3723 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3724 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3725 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3726 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3727 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3728 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3729 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3730 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3731 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3732 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3733 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3734 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3735 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3736 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3737 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3738 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3739 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3740 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3741 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3742 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3743 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3744 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3745 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3746 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3747 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3748 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3749 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3750 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3751 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3752 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3753 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3754 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3755 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3756 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3757 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3758 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3759 {
  persist_with: model_047_hourly_datagroup
}
explore: +explore_3760 {
  persist_with: model_047_hourly_datagroup
}
