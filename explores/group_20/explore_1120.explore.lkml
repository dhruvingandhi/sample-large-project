# Update for 2000 file diff target
# Explore: explore_1120
# Auto-generated LookML Explore File

include: "/views/domain_11/view_03361.view.lkml"
include: "/views/domain_13/view_03363.view.lkml"
include: "/views/domain_14/view_03364.view.lkml"
include: "/views/domain_15/view_03365.view.lkml"

explore: explore_1120 {
  label: "Explore Explore 1120"
  description: "Comprehensive analytics explore joining base view_03361 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03361
  
  always_filter: {
    filters: [view_03361.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03361.created_at_date: "7 days"]
    unless: [view_03361.id, view_03361.status]
  }

  join: view_03363 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03361.user_id} = ${view_03363.id} ;;
    required_joins: []
  }

  join: view_03364 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03361.account_id} = ${view_03364.account_id} ;;
    required_joins: [view_03363]
  }

  join: view_03365 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03361.category} = ${view_03365.category} ;;
  }

  access_filter: {
    field: view_03361.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03361.is_deleted} = false ;;
}
