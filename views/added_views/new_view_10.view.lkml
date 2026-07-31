# Added view 10 on branch dg-3
view: new_view_10 {
  sql_table_name: `analytics.table_10` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
