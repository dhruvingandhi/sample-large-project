# Explore: explore_0328
# Auto-generated LookML Explore File

include: "/views/domain_35/view_00985.view.lkml"
include: "/views/domain_37/view_00987.view.lkml"
include: "/views/domain_38/view_00988.view.lkml"
include: "/views/domain_39/view_00989.view.lkml"

explore: explore_0328 {
  label: "Explore Explore 0328"
  description: "Comprehensive analytics explore joining base view_00985 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00985
  
  always_filter: {
    filters: [view_00985.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00985.created_at_date: "7 days"]
    unless: [view_00985.id, view_00985.status]
  }

  join: view_00987 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00985.user_id} = ${view_00987.id} ;;
    required_joins: []
  }

  join: view_00988 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00985.account_id} = ${view_00988.account_id} ;;
    required_joins: [view_00987]
  }

  join: view_00989 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00985.category} = ${view_00989.category} ;;
  }

  access_filter: {
    field: view_00985.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00985.is_deleted} = false ;;
}
