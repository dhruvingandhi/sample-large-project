# Added view 01 on branch dg-3
view: new_view_01 {
  sql_table_name: `analytics.table_01` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
}
