# Model: model_004
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 004"

datagroup: model_004_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_004_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_004_default_datagroup

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

# Explores included in model model_004
explore: +explore_0241 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0242 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0243 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0244 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0245 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0246 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0247 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0248 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0249 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0250 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0251 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0252 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0253 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0254 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0255 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0256 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0257 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0258 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0259 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0260 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0261 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0262 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0263 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0264 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0265 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0266 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0267 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0268 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0269 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0270 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0271 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0272 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0273 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0274 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0275 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0276 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0277 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0278 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0279 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0280 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0281 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0282 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0283 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0284 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0285 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0286 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0287 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0288 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0289 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0290 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0291 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0292 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0293 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0294 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0295 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0296 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0297 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0298 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0299 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0300 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0301 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0302 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0303 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0304 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0305 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0306 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0307 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0308 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0309 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0310 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0311 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0312 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0313 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0314 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0315 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0316 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0317 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0318 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0319 {
  persist_with: model_004_hourly_datagroup
}
explore: +explore_0320 {
  persist_with: model_004_hourly_datagroup
}
