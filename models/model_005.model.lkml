# Antigravity modified: branch dg-3
# Antigravity modified: branch dg-3
# Model: model_005
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 005"

datagroup: model_005_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_005_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_005_default_datagroup

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

# Explores included in model model_005
explore: +explore_0321 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0322 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0323 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0324 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0325 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0326 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0327 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0328 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0329 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0330 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0331 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0332 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0333 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0334 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0335 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0336 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0337 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0338 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0339 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0340 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0341 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0342 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0343 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0344 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0345 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0346 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0347 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0348 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0349 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0350 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0351 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0352 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0353 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0354 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0355 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0356 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0357 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0358 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0359 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0360 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0361 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0362 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0363 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0364 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0365 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0366 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0367 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0368 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0369 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0370 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0371 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0372 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0373 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0374 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0375 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0376 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0377 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0378 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0379 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0380 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0381 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0382 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0383 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0384 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0385 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0386 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0387 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0388 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0389 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0390 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0391 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0392 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0393 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0394 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0395 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0396 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0397 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0398 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0399 {
  persist_with: model_005_hourly_datagroup
}
explore: +explore_0400 {
  persist_with: model_005_hourly_datagroup
}
