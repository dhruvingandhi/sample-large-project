# Explore: explore_2470
# Auto-generated LookML Explore File

include: "/views/domain_11/view_07411.view.lkml"
include: "/views/domain_13/view_07413.view.lkml"
include: "/views/domain_14/view_07414.view.lkml"
include: "/views/domain_15/view_07415.view.lkml"

explore: explore_2470 {
  label: "Explore Explore 2470"
  description: "Comprehensive analytics explore joining base view_07411 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07411
  
  always_filter: {
    filters: [view_07411.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07411.created_at_date: "7 days"]
    unless: [view_07411.id, view_07411.status]
  }

  join: view_07413 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07411.user_id} = ${view_07413.id} ;;
    required_joins: []
  }

  join: view_07414 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07411.account_id} = ${view_07414.account_id} ;;
    required_joins: [view_07413]
  }

  join: view_07415 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07411.category} = ${view_07415.category} ;;
  }

  access_filter: {
    field: view_07411.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07411.is_deleted} = false ;;
}
