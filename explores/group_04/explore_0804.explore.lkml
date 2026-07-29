# Explore: explore_0804
# Auto-generated LookML Explore File

include: "/views/domain_13/view_02413.view.lkml"
include: "/views/domain_15/view_02415.view.lkml"
include: "/views/domain_16/view_02416.view.lkml"
include: "/views/domain_17/view_02417.view.lkml"

explore: explore_0804 {
  label: "Explore Explore 0804"
  description: "Comprehensive analytics explore joining base view_02413 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02413
  
  always_filter: {
    filters: [view_02413.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02413.created_at_date: "7 days"]
    unless: [view_02413.id, view_02413.status]
  }

  join: view_02415 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02413.user_id} = ${view_02415.id} ;;
    required_joins: []
  }

  join: view_02416 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02413.account_id} = ${view_02416.account_id} ;;
    required_joins: [view_02415]
  }

  join: view_02417 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02413.category} = ${view_02417.category} ;;
  }

  access_filter: {
    field: view_02413.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02413.is_deleted} = false ;;
}
