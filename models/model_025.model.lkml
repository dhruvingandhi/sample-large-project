# Model: model_025
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 025"

datagroup: model_025_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_025_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_025_default_datagroup

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

# Explores included in model model_025
explore: +explore_1921 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1922 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1923 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1924 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1925 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1926 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1927 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1928 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1929 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1930 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1931 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1932 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1933 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1934 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1935 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1936 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1937 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1938 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1939 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1940 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1941 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1942 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1943 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1944 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1945 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1946 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1947 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1948 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1949 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1950 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1951 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1952 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1953 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1954 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1955 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1956 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1957 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1958 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1959 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1960 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1961 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1962 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1963 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1964 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1965 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1966 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1967 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1968 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1969 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1970 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1971 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1972 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1973 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1974 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1975 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1976 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1977 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1978 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1979 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1980 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1981 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1982 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1983 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1984 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1985 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1986 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1987 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1988 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1989 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1990 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1991 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1992 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1993 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1994 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1995 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1996 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1997 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1998 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_1999 {
  persist_with: model_025_hourly_datagroup
}
explore: +explore_2000 {
  persist_with: model_025_hourly_datagroup
}
