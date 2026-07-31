# Added view 07 on branch dg-3
view: new_view_07 {
  sql_table_name: `analytics.table_07` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
