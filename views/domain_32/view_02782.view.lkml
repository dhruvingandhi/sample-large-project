# DRASTICALLY MODIFIED VERSION 2.0 FOR BRANCH TESTING
# Refactored schema and extended metrics
# View: view_02782
# Auto-generated LookML View File
# Description: Defines dimensions, measures, sets, and table references for view_02782.

view: view_02782 {
  sql_table_name: v2_transformed_schema.refactored_table_282 ;;
  drill_fields: [id, category, status, amount]

  # Dynamic Parameters and Filters
  parameter: date_granularity {
    type: string
    allowed_value: { value: "day" label: "Daily" }
    allowed_value: { value: "week" label: "Weekly" }
    allowed_value: { value: "month" label: "Monthly" }
    allowed_value: { value: "year" label: "Yearly" }
    default_value: "day"
  }

  parameter: metric_selector {
    type: string
    allowed_value: { value: "revenue" label: "Net Revenue" }
    allowed_value: { value: "volume" label: "Total Volume" }
    allowed_value: { value: "count" label: "Record Count" }
    default_value: "revenue"
  }

  filter: custom_status_filter {
    type: string
    suggest_dimension: status
  }

  # Dimension Definitions
  dimension: id {
    type: number
    group_label: "Primary Key"
    description: "Dimension id for view view_02782"
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: no
  }

  dimension: created_at {
    type: time
    group_label: "Timestamps"
    description: "Dimension created_at for view view_02782"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: updated_at {
    type: time
    group_label: "Timestamps"
    description: "Dimension updated_at for view view_02782"
    timeframes: [raw, time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: deleted_at {
    type: time
    group_label: "Timestamps"
    description: "Dimension deleted_at for view view_02782"
    timeframes: [raw, time, date, month]
    sql: ${TABLE}.deleted_at ;;
    hidden: yes
  }

  dimension: status {
    type: string
    group_label: "Attributes"
    description: "Dimension status for view view_02782"
    sql: ${TABLE}.status ;;
    description: "Current status of record"
    drill_fields: [id, created_date, status]
  }

  dimension: category {
    type: string
    group_label: "Attributes"
    description: "Dimension category for view view_02782"
    sql: ${TABLE}.category ;;
    description: "Category grouping"
  }

  dimension: subcategory {
    type: string
    group_label: "Attributes"
    description: "Dimension subcategory for view view_02782"
    sql: ${TABLE}.subcategory ;;
    description: "Detailed subcategory classification"
  }

  dimension: user_id {
    type: number
    group_label: "User Info"
    description: "Dimension user_id for view view_02782"
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension: account_id {
    type: number
    group_label: "Account Info"
    description: "Dimension account_id for view view_02782"
    sql: ${TABLE}.account_id ;;
    hidden: yes
  }

  dimension: organization_id {
    type: number
    group_label: "Account Info"
    description: "Dimension organization_id for view view_02782"
    sql: ${TABLE}.org_id ;;
    hidden: yes
  }

  dimension: amount_cents {
    type: number
    group_label: "Financials"
    description: "Dimension amount_cents for view view_02782"
    sql: ${TABLE}.amount_cents ;;
    hidden: yes
  }

  dimension: amount {
    type: number
    group_label: "Financials"
    description: "Dimension amount for view view_02782"
    sql: ${TABLE}.amount_cents / 100.0 ;;
    value_format_name: usd
    description: "Total transaction amount in USD"
  }

  dimension: tax_amount {
    type: number
    group_label: "Financials"
    description: "Dimension tax_amount for view view_02782"
    sql: ${TABLE}.tax_amount_cents / 100.0 ;;
    value_format_name: usd
  }

  dimension: discount_amount {
    type: number
    group_label: "Financials"
    description: "Dimension discount_amount for view view_02782"
    sql: ${TABLE}.discount_amount ;;
    value_format_name: usd
  }

  dimension: shipping_fee {
    type: number
    group_label: "Financials"
    description: "Dimension shipping_fee for view view_02782"
    sql: ${TABLE}.shipping_fee_cents / 100.0 ;;
    value_format_name: usd
  }

  dimension: currency_code {
    type: string
    group_label: "Financials"
    description: "Dimension currency_code for view view_02782"
    sql: ${TABLE}.currency_code ;;
    description: "ISO currency code (e.g. USD, EUR, GBP)"
  }

  dimension: country_code {
    type: string
    group_label: "Geography"
    description: "Dimension country_code for view view_02782"
    sql: ${TABLE}.country_code ;;
    map_layer_name: countries
  }

  dimension: state_province {
    type: string
    group_label: "Geography"
    description: "Dimension state_province for view view_02782"
    sql: ${TABLE}.state_province ;;
  }

  dimension: city {
    type: string
    group_label: "Geography"
    description: "Dimension city for view view_02782"
    sql: ${TABLE}.city ;;
  }

  dimension: postal_code {
    type: zipcode
    group_label: "Geography"
    description: "Dimension postal_code for view view_02782"
    sql: ${TABLE}.postal_code ;;
  }

  dimension: is_active {
    type: yesno
    group_label: "Flags"
    description: "Dimension is_active for view view_02782"
    sql: ${TABLE}.is_active = true ;;
  }

  dimension: is_deleted {
    type: yesno
    group_label: "Flags"
    description: "Dimension is_deleted for view view_02782"
    sql: ${TABLE}.is_deleted = true ;;
    hidden: yes
  }

  dimension: is_verified {
    type: yesno
    group_label: "Flags"
    description: "Dimension is_verified for view view_02782"
    sql: ${TABLE}.is_verified = true ;;
  }

  dimension: tier {
    type: tier
    group_label: "Segmentation"
    description: "Dimension tier for view view_02782"
    tiers: [0, 10, 50, 100, 500, 1000]
    style: integer
    sql: ${amount} ;;
  }

  dimension: email_domain {
    type: string
    group_label: "User Info"
    description: "Dimension email_domain for view view_02782"
    sql: SPLIT_PART(${TABLE}.email, '@', 2) ;;
  }

  dimension: device_type {
    type: string
    group_label: "Technical Meta"
    description: "Dimension device_type for view view_02782"
    sql: CASE WHEN ${TABLE}.user_agent LIKE '%Mobile%' THEN 'Mobile' WHEN ${TABLE}.user_agent LIKE '%Tablet%' THEN 'Tablet' ELSE 'Desktop' END ;;
  }

  dimension: channel {
    type: string
    group_label: "Marketing"
    description: "Dimension channel for view view_02782"
    sql: COALESCE(${TABLE}.utm_source, 'Direct') ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Marketing"
    description: "Dimension campaign_name for view view_02782"
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: score {
    type: number
    group_label: "Analytics"
    description: "Dimension score for view view_02782"
    sql: ${TABLE}.engagement_score ;;
    value_format_name: decimal_2
  }

  # Set Definitions
  set: detail_set {
    fields: [
      id,
      created_at_time,
      status,
      category,
      subcategory,
      amount,
      currency_code,
      country_code
    ]
  }

  set: marketing_set {
    fields: [
      channel,
      campaign_name,
      email_domain,
      device_type
    ]
  }

  set: financial_set {
    fields: [
      amount,
      tax_amount,
      discount_amount,
      shipping_fee,
      net_revenue,
      currency_code
    ]
  }

  # Measure Definitions
  measure: count {
    type: count
    label: "Count"
    drill_fields: [id, created_date, status, category, amount]
  }

  measure: count_distinct_users {
    type: count_distinct
    label: "Count Distinct Users"
    sql: ${user_id} ;;
    description: "Distinct number of users"
  }

  measure: count_distinct_accounts {
    type: count_distinct
    label: "Count Distinct Accounts"
    sql: ${account_id} ;;
    description: "Distinct number of accounts"
  }

  measure: total_amount {
    type: sum
    label: "Total Amount"
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [detail_set*]
  }

  measure: average_amount {
    type: average
    label: "Average Amount"
    sql: ${amount} ;;
    value_format_name: usd_0
  }

  measure: median_amount {
    type: median
    label: "Median Amount"
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: max_amount {
    type: max
    label: "Max Amount"
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: min_amount {
    type: min
    label: "Min Amount"
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: total_tax {
    type: sum
    label: "Total Tax"
    sql: ${tax_amount} ;;
    value_format_name: usd
  }

  measure: total_discount {
    type: sum
    label: "Total Discount"
    sql: ${discount_amount} ;;
    value_format_name: usd
  }

  measure: total_shipping {
    type: sum
    label: "Total Shipping"
    sql: ${shipping_fee} ;;
    value_format_name: usd
  }

  measure: net_revenue {
    type: sum
    label: "Net Revenue"
    sql: ${amount} - ${discount_amount} ;;
    value_format_name: usd
  }

  measure: active_records_count {
    type: count
    label: "Active Records Count"
    filters: [is_active: "yes"]
    description: "Count of active records only"
  }

  # Derived Calculation Dimensions
  dimension: calculated_profit_margin {
    type: number
    sql: CASE WHEN ${amount} > 0 THEN (${amount} - ${tax_amount} - ${discount_amount}) / ${amount} ELSE 0 END ;;
    value_format_name: percent_2
    description: "Calculated profit margin after deducting tax and discounts"
  }

  dimension: status_group {
    type: string
    sql: CASE 
      WHEN ${status} IN ('completed', 'shipped', 'delivered') THEN 'Success'
      WHEN ${status} IN ('pending', 'processing') THEN 'In Progress'
      WHEN ${status} IN ('cancelled', 'failed', 'returned') THEN 'Failed/Cancelled'
      ELSE 'Other'
    END ;;
  }

  dimension: dynamic_dimension_selector {{
    type: string
    sql: CASE 
      WHEN {{% parameter date_granularity %}} = 'week' THEN ${created_at_week}
      WHEN {{% parameter date_granularity %}} = 'month' THEN ${created_at_month}
      WHEN {{% parameter date_granularity %}} = 'year' THEN ${created_at_year}
      ELSE ${created_at_date}
    END ;;
  }}
}}

  # BRAND NEW EXTENDED DIMENSIONS FOR V2
  dimension: v2_feature_flag_enabled {
    type: yesno
    sql: ${TABLE}.v2_feature_flag = TRUE ;;
    description: "V2 Refactoring: New feature flag tracking"
  }

  dimension: v2_custom_json_data {
    type: string
    sql: ${TABLE}.v2_metadata_json:custom_field::string ;;
    description: "V2 Refactoring: Extracted JSON field"
  }

  measure: v2_total_custom_score {
    type: sum
    sql: ${TABLE}.v2_score_value ;;
    value_format_name: decimal_2
  }
