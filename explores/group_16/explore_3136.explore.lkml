# Explore: explore_3136
# Auto-generated LookML Explore File

include: "/views/domain_09/view_09409.view.lkml"
include: "/views/domain_11/view_09411.view.lkml"
include: "/views/domain_12/view_09412.view.lkml"
include: "/views/domain_13/view_09413.view.lkml"

explore: explore_3136 {
  label: "Explore Explore 3136"
  description: "Comprehensive analytics explore joining base view_09409 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09409
  
  always_filter: {
    filters: [view_09409.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09409.created_at_date: "7 days"]
    unless: [view_09409.id, view_09409.status]
  }

  join: view_09411 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09409.user_id} = ${view_09411.id} ;;
    required_joins: []
  }

  join: view_09412 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09409.account_id} = ${view_09412.account_id} ;;
    required_joins: [view_09411]
  }

  join: view_09413 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09409.category} = ${view_09413.category} ;;
  }

  access_filter: {
    field: view_09409.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09409.is_deleted} = false ;;
}
