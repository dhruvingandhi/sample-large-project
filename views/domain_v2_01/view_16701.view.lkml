# NEW VIEW V2: view_16701
# Created during Branch Testing - Drastic Changes

view: view_16701 {
  sql_table_name: v2_analytics.new_table_16701 ;;
  drill_fields: [id, status, total_amount]

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  dimension: created_at {
    type: time
    timeframes: [raw, time, date, month, year]
    sql: ${TABLE}.created_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, status]
  }

  measure: sum_amount {
    type: sum
    sql: ${total_amount} ;;
    value_format_name: usd
  }
}
