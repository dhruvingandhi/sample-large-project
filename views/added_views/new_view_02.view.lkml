# Added view 02 on branch dg-3
view: new_view_02 {
  sql_table_name: `analytics.table_02` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
