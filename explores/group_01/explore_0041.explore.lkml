# Explore: explore_0041
# Auto-generated LookML Explore File

include: "/views/domain_24/view_00124.view.lkml"
include: "/views/domain_26/view_00126.view.lkml"
include: "/views/domain_27/view_00127.view.lkml"
include: "/views/domain_28/view_00128.view.lkml"

explore: explore_0041 {
  label: "Explore Explore 0041"
  description: "Comprehensive analytics explore joining base view_00124 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00124
  
  always_filter: {
    filters: [view_00124.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00124.created_at_date: "7 days"]
    unless: [view_00124.id, view_00124.status]
  }

  join: view_00126 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00124.user_id} = ${view_00126.id} ;;
    required_joins: []
  }

  join: view_00127 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00124.account_id} = ${view_00127.account_id} ;;
    required_joins: [view_00126]
  }

  join: view_00128 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00124.category} = ${view_00128.category} ;;
  }

  access_filter: {
    field: view_00124.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00124.is_deleted} = false ;;
}
