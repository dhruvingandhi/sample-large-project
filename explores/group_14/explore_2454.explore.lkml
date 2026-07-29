# Explore: explore_2454
# Auto-generated LookML Explore File

include: "/views/domain_13/view_07363.view.lkml"
include: "/views/domain_15/view_07365.view.lkml"
include: "/views/domain_16/view_07366.view.lkml"
include: "/views/domain_17/view_07367.view.lkml"

explore: explore_2454 {
  label: "Explore Explore 2454"
  description: "Comprehensive analytics explore joining base view_07363 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07363
  
  always_filter: {
    filters: [view_07363.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07363.created_at_date: "7 days"]
    unless: [view_07363.id, view_07363.status]
  }

  join: view_07365 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07363.user_id} = ${view_07365.id} ;;
    required_joins: []
  }

  join: view_07366 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07363.account_id} = ${view_07366.account_id} ;;
    required_joins: [view_07365]
  }

  join: view_07367 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07363.category} = ${view_07367.category} ;;
  }

  access_filter: {
    field: view_07363.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07363.is_deleted} = false ;;
}
