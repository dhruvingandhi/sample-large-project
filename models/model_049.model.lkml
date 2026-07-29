# Model: model_049
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 049"

datagroup: model_049_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_049_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_049_default_datagroup

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

# Explores included in model model_049
explore: +explore_3841 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3842 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3843 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3844 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3845 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3846 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3847 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3848 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3849 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3850 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3851 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3852 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3853 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3854 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3855 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3856 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3857 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3858 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3859 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3860 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3861 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3862 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3863 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3864 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3865 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3866 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3867 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3868 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3869 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3870 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3871 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3872 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3873 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3874 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3875 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3876 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3877 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3878 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3879 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3880 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3881 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3882 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3883 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3884 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3885 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3886 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3887 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3888 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3889 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3890 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3891 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3892 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3893 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3894 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3895 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3896 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3897 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3898 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3899 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3900 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3901 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3902 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3903 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3904 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3905 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3906 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3907 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3908 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3909 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3910 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3911 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3912 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3913 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3914 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3915 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3916 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3917 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3918 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3919 {
  persist_with: model_049_hourly_datagroup
}
explore: +explore_3920 {
  persist_with: model_049_hourly_datagroup
}
