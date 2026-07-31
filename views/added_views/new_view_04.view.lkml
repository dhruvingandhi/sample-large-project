# Added view 04 on branch dg-3
view: new_view_04 {
  sql_table_name: `analytics.table_04` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
