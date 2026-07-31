# Added view 03 on branch dg-3
view: new_view_03 {
  sql_table_name: `analytics.table_03` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
