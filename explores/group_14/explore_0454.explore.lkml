# Explore: explore_0454
# Auto-generated LookML Explore File

include: "/views/domain_13/view_01363.view.lkml"
include: "/views/domain_15/view_01365.view.lkml"
include: "/views/domain_16/view_01366.view.lkml"
include: "/views/domain_17/view_01367.view.lkml"

explore: explore_0454 {
  label: "Explore Explore 0454"
  description: "Comprehensive analytics explore joining base view_01363 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01363
  
  always_filter: {
    filters: [view_01363.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01363.created_at_date: "7 days"]
    unless: [view_01363.id, view_01363.status]
  }

  join: view_01365 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01363.user_id} = ${view_01365.id} ;;
    required_joins: []
  }

  join: view_01366 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01363.account_id} = ${view_01366.account_id} ;;
    required_joins: [view_01365]
  }

  join: view_01367 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01363.category} = ${view_01367.category} ;;
  }

  access_filter: {
    field: view_01363.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01363.is_deleted} = false ;;
}
