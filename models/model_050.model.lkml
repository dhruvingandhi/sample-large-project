# Antigravity modified: branch dg-3
# Model: model_050
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 050"

datagroup: model_050_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_050_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_050_default_datagroup

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

# Explores included in model model_050
explore: +explore_3921 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3922 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3923 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3924 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3925 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3926 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3927 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3928 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3929 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3930 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3931 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3932 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3933 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3934 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3935 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3936 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3937 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3938 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3939 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3940 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3941 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3942 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3943 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3944 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3945 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3946 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3947 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3948 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3949 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3950 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3951 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3952 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3953 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3954 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3955 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3956 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3957 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3958 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3959 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3960 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3961 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3962 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3963 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3964 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3965 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3966 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3967 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3968 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3969 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3970 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3971 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3972 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3973 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3974 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3975 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3976 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3977 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3978 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3979 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3980 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3981 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3982 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3983 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3984 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3985 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3986 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3987 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3988 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3989 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3990 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3991 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3992 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3993 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3994 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3995 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3996 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3997 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3998 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_3999 {
  persist_with: model_050_hourly_datagroup
}
explore: +explore_4000 {
  persist_with: model_050_hourly_datagroup
}
