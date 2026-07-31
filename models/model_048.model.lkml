# Update for 500 file diff target
# Model: model_048
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 048"

datagroup: model_048_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_048_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_048_default_datagroup

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

# Explores included in model model_048
explore: +explore_3761 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3762 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3763 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3764 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3765 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3766 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3767 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3768 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3769 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3770 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3771 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3772 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3773 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3774 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3775 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3776 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3777 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3778 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3779 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3780 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3781 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3782 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3783 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3784 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3785 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3786 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3787 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3788 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3789 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3790 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3791 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3792 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3793 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3794 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3795 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3796 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3797 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3798 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3799 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3800 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3801 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3802 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3803 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3804 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3805 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3806 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3807 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3808 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3809 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3810 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3811 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3812 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3813 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3814 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3815 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3816 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3817 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3818 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3819 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3820 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3821 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3822 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3823 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3824 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3825 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3826 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3827 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3828 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3829 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3830 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3831 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3832 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3833 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3834 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3835 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3836 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3837 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3838 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3839 {
  persist_with: model_048_hourly_datagroup
}
explore: +explore_3840 {
  persist_with: model_048_hourly_datagroup
}
