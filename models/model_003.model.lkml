# Antigravity modified: branch dg-3
# Model: model_003
# Auto-generated LookML Model File

connection: "analytics_snowflake_db"

include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore.lkml"

label: "Business Intelligence Model 003"

datagroup: model_003_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_execution_log WHERE status = 'SUCCESS' ;;
  max_cache_age: "4 hours"
  description: "Standard datagroup trigger based on ETL log table completion."
}

datagroup: model_003_hourly_datagroup {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / 3600) ;;
  max_cache_age: "1 hour"
}

persist_with: model_003_default_datagroup

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

# Explores included in model model_003
explore: +explore_0161 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0162 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0163 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0164 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0165 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0166 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0167 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0168 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0169 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0170 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0171 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0172 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0173 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0174 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0175 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0176 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0177 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0178 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0179 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0180 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0181 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0182 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0183 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0184 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0185 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0186 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0187 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0188 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0189 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0190 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0191 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0192 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0193 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0194 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0195 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0196 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0197 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0198 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0199 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0200 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0201 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0202 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0203 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0204 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0205 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0206 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0207 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0208 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0209 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0210 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0211 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0212 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0213 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0214 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0215 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0216 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0217 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0218 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0219 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0220 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0221 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0222 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0223 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0224 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0225 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0226 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0227 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0228 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0229 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0230 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0231 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0232 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0233 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0234 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0235 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0236 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0237 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0238 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0239 {
  persist_with: model_003_hourly_datagroup
}
explore: +explore_0240 {
  persist_with: model_003_hourly_datagroup
}
