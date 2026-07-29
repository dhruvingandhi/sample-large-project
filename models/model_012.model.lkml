# Model: model_012
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 012"

datagroup: model_012_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_012_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_012_default_datagroup

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

# Explores included in model model_012
explore: +explore_0881 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0882 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0883 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0884 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0885 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0886 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0887 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0888 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0889 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0890 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0891 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0892 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0893 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0894 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0895 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0896 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0897 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0898 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0899 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0900 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0901 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0902 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0903 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0904 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0905 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0906 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0907 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0908 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0909 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0910 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0911 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0912 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0913 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0914 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0915 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0916 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0917 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0918 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0919 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0920 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0921 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0922 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0923 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0924 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0925 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0926 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0927 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0928 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0929 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0930 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0931 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0932 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0933 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0934 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0935 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0936 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0937 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0938 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0939 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0940 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0941 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0942 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0943 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0944 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0945 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0946 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0947 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0948 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0949 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0950 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0951 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0952 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0953 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0954 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0955 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0956 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0957 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0958 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0959 {
  persist_with: model_012_hourly_datagroup
}
explore: +explore_0960 {
  persist_with: model_012_hourly_datagroup
}
