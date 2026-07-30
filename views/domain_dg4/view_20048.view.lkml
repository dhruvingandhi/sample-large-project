# NEW VIEW ON BRANCH DG-4: view_20048

view: view_20048 {
  sql_table_name: dg4_analytics.table_20048 ;;
  drill_fields: [id, status, amount]

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: count {
    type: count
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }
}
