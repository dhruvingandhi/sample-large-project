# Explore: explore_1804
# Auto-generated LookML Explore File

include: "/views/domain_13/view_05413.view.lkml"
include: "/views/domain_15/view_05415.view.lkml"
include: "/views/domain_16/view_05416.view.lkml"
include: "/views/domain_17/view_05417.view.lkml"

explore: explore_1804 {
  label: "Explore Explore 1804"
  description: "Comprehensive analytics explore joining base view_05413 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05413
  
  always_filter: {
    filters: [view_05413.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05413.created_at_date: "7 days"]
    unless: [view_05413.id, view_05413.status]
  }

  join: view_05415 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05413.user_id} = ${view_05415.id} ;;
    required_joins: []
  }

  join: view_05416 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05413.account_id} = ${view_05416.account_id} ;;
    required_joins: [view_05415]
  }

  join: view_05417 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05413.category} = ${view_05417.category} ;;
  }

  access_filter: {
    field: view_05413.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05413.is_deleted} = false ;;
}
