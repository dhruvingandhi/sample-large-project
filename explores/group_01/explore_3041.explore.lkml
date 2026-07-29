# Explore: explore_3041
# Auto-generated LookML Explore File

include: "/views/domain_24/view_09124.view.lkml"
include: "/views/domain_26/view_09126.view.lkml"
include: "/views/domain_27/view_09127.view.lkml"
include: "/views/domain_28/view_09128.view.lkml"

explore: explore_3041 {
  label: "Explore Explore 3041"
  description: "Comprehensive analytics explore joining base view_09124 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09124
  
  always_filter: {
    filters: [view_09124.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09124.created_at_date: "7 days"]
    unless: [view_09124.id, view_09124.status]
  }

  join: view_09126 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09124.user_id} = ${view_09126.id} ;;
    required_joins: []
  }

  join: view_09127 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09124.account_id} = ${view_09127.account_id} ;;
    required_joins: [view_09126]
  }

  join: view_09128 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09124.category} = ${view_09128.category} ;;
  }

  access_filter: {
    field: view_09124.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09124.is_deleted} = false ;;
}
