# Added view 08 on branch dg-3
view: new_view_08 {
  sql_table_name: `analytics.table_08` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
