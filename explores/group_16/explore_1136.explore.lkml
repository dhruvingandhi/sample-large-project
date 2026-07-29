# Explore: explore_1136
# Auto-generated LookML Explore File

include: "/views/domain_09/view_03409.view.lkml"
include: "/views/domain_11/view_03411.view.lkml"
include: "/views/domain_12/view_03412.view.lkml"
include: "/views/domain_13/view_03413.view.lkml"

explore: explore_1136 {
  label: "Explore Explore 1136"
  description: "Comprehensive analytics explore joining base view_03409 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03409
  
  always_filter: {
    filters: [view_03409.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03409.created_at_date: "7 days"]
    unless: [view_03409.id, view_03409.status]
  }

  join: view_03411 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03409.user_id} = ${view_03411.id} ;;
    required_joins: []
  }

  join: view_03412 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03409.account_id} = ${view_03412.account_id} ;;
    required_joins: [view_03411]
  }

  join: view_03413 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03409.category} = ${view_03413.category} ;;
  }

  access_filter: {
    field: view_03409.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03409.is_deleted} = false ;;
}
