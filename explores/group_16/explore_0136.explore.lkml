# Explore: explore_0136
# Auto-generated LookML Explore File

include: "/views/domain_09/view_00409.view.lkml"
include: "/views/domain_11/view_00411.view.lkml"
include: "/views/domain_12/view_00412.view.lkml"
include: "/views/domain_13/view_00413.view.lkml"

explore: explore_0136 {
  label: "Explore Explore 0136"
  description: "Comprehensive analytics explore joining base view_00409 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00409
  
  always_filter: {
    filters: [view_00409.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00409.created_at_date: "7 days"]
    unless: [view_00409.id, view_00409.status]
  }

  join: view_00411 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00409.user_id} = ${view_00411.id} ;;
    required_joins: []
  }

  join: view_00412 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00409.account_id} = ${view_00412.account_id} ;;
    required_joins: [view_00411]
  }

  join: view_00413 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00409.category} = ${view_00413.category} ;;
  }

  access_filter: {
    field: view_00409.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00409.is_deleted} = false ;;
}
