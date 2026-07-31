# Added view 09 on branch dg-3
view: new_view_09 {
  sql_table_name: `analytics.table_09` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
