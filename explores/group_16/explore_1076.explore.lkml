# Explore: explore_1076
# Auto-generated LookML Explore File

include: "/views/domain_29/view_03229.view.lkml"
include: "/views/domain_31/view_03231.view.lkml"
include: "/views/domain_32/view_03232.view.lkml"
include: "/views/domain_33/view_03233.view.lkml"

explore: explore_1076 {
  label: "Explore Explore 1076"
  description: "Comprehensive analytics explore joining base view_03229 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03229
  
  always_filter: {
    filters: [view_03229.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03229.created_at_date: "7 days"]
    unless: [view_03229.id, view_03229.status]
  }

  join: view_03231 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03229.user_id} = ${view_03231.id} ;;
    required_joins: []
  }

  join: view_03232 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03229.account_id} = ${view_03232.account_id} ;;
    required_joins: [view_03231]
  }

  join: view_03233 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03229.category} = ${view_03233.category} ;;
  }

  access_filter: {
    field: view_03229.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03229.is_deleted} = false ;;
}
