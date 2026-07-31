# Added view 05 on branch dg-3
view: new_view_05 {
  sql_table_name: `analytics.table_05` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
