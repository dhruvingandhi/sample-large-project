# Explore: explore_0486
# Auto-generated LookML Explore File

include: "/views/domain_09/view_01459.view.lkml"
include: "/views/domain_11/view_01461.view.lkml"
include: "/views/domain_12/view_01462.view.lkml"
include: "/views/domain_13/view_01463.view.lkml"

explore: explore_0486 {
  label: "Explore Explore 0486"
  description: "Comprehensive analytics explore joining base view_01459 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01459
  
  always_filter: {
    filters: [view_01459.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01459.created_at_date: "7 days"]
    unless: [view_01459.id, view_01459.status]
  }

  join: view_01461 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01459.user_id} = ${view_01461.id} ;;
    required_joins: []
  }

  join: view_01462 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01459.account_id} = ${view_01462.account_id} ;;
    required_joins: [view_01461]
  }

  join: view_01463 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01459.category} = ${view_01463.category} ;;
  }

  access_filter: {
    field: view_01459.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01459.is_deleted} = false ;;
}
