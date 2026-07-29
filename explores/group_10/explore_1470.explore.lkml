# Explore: explore_1470
# Auto-generated LookML Explore File

include: "/views/domain_11/view_04411.view.lkml"
include: "/views/domain_13/view_04413.view.lkml"
include: "/views/domain_14/view_04414.view.lkml"
include: "/views/domain_15/view_04415.view.lkml"

explore: explore_1470 {
  label: "Explore Explore 1470"
  description: "Comprehensive analytics explore joining base view_04411 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04411
  
  always_filter: {
    filters: [view_04411.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04411.created_at_date: "7 days"]
    unless: [view_04411.id, view_04411.status]
  }

  join: view_04413 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04411.user_id} = ${view_04413.id} ;;
    required_joins: []
  }

  join: view_04414 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04411.account_id} = ${view_04414.account_id} ;;
    required_joins: [view_04413]
  }

  join: view_04415 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04411.category} = ${view_04415.category} ;;
  }

  access_filter: {
    field: view_04411.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04411.is_deleted} = false ;;
}
