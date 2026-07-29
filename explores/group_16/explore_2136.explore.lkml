# Explore: explore_2136
# Auto-generated LookML Explore File

include: "/views/domain_09/view_06409.view.lkml"
include: "/views/domain_11/view_06411.view.lkml"
include: "/views/domain_12/view_06412.view.lkml"
include: "/views/domain_13/view_06413.view.lkml"

explore: explore_2136 {
  label: "Explore Explore 2136"
  description: "Comprehensive analytics explore joining base view_06409 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06409
  
  always_filter: {
    filters: [view_06409.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06409.created_at_date: "7 days"]
    unless: [view_06409.id, view_06409.status]
  }

  join: view_06411 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06409.user_id} = ${view_06411.id} ;;
    required_joins: []
  }

  join: view_06412 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06409.account_id} = ${view_06412.account_id} ;;
    required_joins: [view_06411]
  }

  join: view_06413 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06409.category} = ${view_06413.category} ;;
  }

  access_filter: {
    field: view_06409.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06409.is_deleted} = false ;;
}
