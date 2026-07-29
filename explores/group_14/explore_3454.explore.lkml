# Explore: explore_3454
# Auto-generated LookML Explore File

include: "/views/domain_13/view_10363.view.lkml"
include: "/views/domain_15/view_10365.view.lkml"
include: "/views/domain_16/view_10366.view.lkml"
include: "/views/domain_17/view_10367.view.lkml"

explore: explore_3454 {
  label: "Explore Explore 3454"
  description: "Comprehensive analytics explore joining base view_10363 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10363
  
  always_filter: {
    filters: [view_10363.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10363.created_at_date: "7 days"]
    unless: [view_10363.id, view_10363.status]
  }

  join: view_10365 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10363.user_id} = ${view_10365.id} ;;
    required_joins: []
  }

  join: view_10366 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10363.account_id} = ${view_10366.account_id} ;;
    required_joins: [view_10365]
  }

  join: view_10367 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10363.category} = ${view_10367.category} ;;
  }

  access_filter: {
    field: view_10363.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10363.is_deleted} = false ;;
}
