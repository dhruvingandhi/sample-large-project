# Explore: explore_2120
# Auto-generated LookML Explore File

include: "/views/domain_11/view_06361.view.lkml"
include: "/views/domain_13/view_06363.view.lkml"
include: "/views/domain_14/view_06364.view.lkml"
include: "/views/domain_15/view_06365.view.lkml"

explore: explore_2120 {
  label: "Explore Explore 2120"
  description: "Comprehensive analytics explore joining base view_06361 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06361
  
  always_filter: {
    filters: [view_06361.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06361.created_at_date: "7 days"]
    unless: [view_06361.id, view_06361.status]
  }

  join: view_06363 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06361.user_id} = ${view_06363.id} ;;
    required_joins: []
  }

  join: view_06364 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06361.account_id} = ${view_06364.account_id} ;;
    required_joins: [view_06363]
  }

  join: view_06365 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06361.category} = ${view_06365.category} ;;
  }

  access_filter: {
    field: view_06361.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06361.is_deleted} = false ;;
}
