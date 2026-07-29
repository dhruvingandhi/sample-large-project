# Explore: explore_2804
# Auto-generated LookML Explore File

include: "/views/domain_13/view_08413.view.lkml"
include: "/views/domain_15/view_08415.view.lkml"
include: "/views/domain_16/view_08416.view.lkml"
include: "/views/domain_17/view_08417.view.lkml"

explore: explore_2804 {
  label: "Explore Explore 2804"
  description: "Comprehensive analytics explore joining base view_08413 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08413
  
  always_filter: {
    filters: [view_08413.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08413.created_at_date: "7 days"]
    unless: [view_08413.id, view_08413.status]
  }

  join: view_08415 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08413.user_id} = ${view_08415.id} ;;
    required_joins: []
  }

  join: view_08416 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08413.account_id} = ${view_08416.account_id} ;;
    required_joins: [view_08415]
  }

  join: view_08417 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08413.category} = ${view_08417.category} ;;
  }

  access_filter: {
    field: view_08413.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08413.is_deleted} = false ;;
}
