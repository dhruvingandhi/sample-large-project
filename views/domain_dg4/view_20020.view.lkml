# DG-5 ADD/ADD CONFLICT VIEW: view_20020
# Created on dg-5 with completely different structure than dg-4

view: view_20020 {
  sql_table_name: dg5_alternate_schema.table_20020 ;;

  dimension: alternate_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.alt_id ;;
  }

  dimension: dg5_specific_category {
    type: string
    sql: ${TABLE}.dg5_category ;;
  }

  measure: dg5_alternate_sum {
    type: sum
    sql: ${TABLE}.alt_amount ;;
  }
}
