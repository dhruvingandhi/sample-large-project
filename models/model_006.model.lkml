# Antigravity modified: branch dg-3
# Model: model_006
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 006"

datagroup: model_006_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_006_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_006_default_datagroup

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

# Explores included in model model_006
explore: +explore_0401 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0402 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0403 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0404 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0405 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0406 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0407 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0408 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0409 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0410 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0411 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0412 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0413 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0414 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0415 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0416 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0417 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0418 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0419 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0420 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0421 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0422 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0423 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0424 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0425 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0426 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0427 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0428 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0429 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0430 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0431 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0432 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0433 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0434 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0435 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0436 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0437 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0438 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0439 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0440 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0441 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0442 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0443 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0444 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0445 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0446 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0447 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0448 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0449 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0450 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0451 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0452 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0453 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0454 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0455 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0456 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0457 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0458 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0459 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0460 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0461 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0462 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0463 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0464 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0465 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0466 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0467 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0468 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0469 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0470 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0471 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0472 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0473 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0474 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0475 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0476 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0477 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0478 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0479 {
  persist_with: model_006_hourly_datagroup
}
explore: +explore_0480 {
  persist_with: model_006_hourly_datagroup
}
