# Added view 06 on branch dg-3
view: new_view_06 {
  sql_table_name: `analytics.table_06` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
