# Update for 2000 file diff target
# Explore: explore_0120
# Auto-generated LookML Explore File

include: "/views/domain_11/view_00361.view.lkml"
include: "/views/domain_13/view_00363.view.lkml"
include: "/views/domain_14/view_00364.view.lkml"
include: "/views/domain_15/view_00365.view.lkml"

explore: explore_0120 {
  label: "Explore Explore 0120"
  description: "Comprehensive analytics explore joining base view_00361 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00361
  
  always_filter: {
    filters: [view_00361.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00361.created_at_date: "7 days"]
    unless: [view_00361.id, view_00361.status]
  }

  join: view_00363 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00361.user_id} = ${view_00363.id} ;;
    required_joins: []
  }

  join: view_00364 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00361.account_id} = ${view_00364.account_id} ;;
    required_joins: [view_00363]
  }

  join: view_00365 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00361.category} = ${view_00365.category} ;;
  }

  access_filter: {
    field: view_00361.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00361.is_deleted} = false ;;
}
