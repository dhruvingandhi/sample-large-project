# Explore: explore_1454
# Auto-generated LookML Explore File

include: "/views/domain_13/view_04363.view.lkml"
include: "/views/domain_15/view_04365.view.lkml"
include: "/views/domain_16/view_04366.view.lkml"
include: "/views/domain_17/view_04367.view.lkml"

explore: explore_1454 {
  label: "Explore Explore 1454"
  description: "Comprehensive analytics explore joining base view_04363 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04363
  
  always_filter: {
    filters: [view_04363.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04363.created_at_date: "7 days"]
    unless: [view_04363.id, view_04363.status]
  }

  join: view_04365 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04363.user_id} = ${view_04365.id} ;;
    required_joins: []
  }

  join: view_04366 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04363.account_id} = ${view_04366.account_id} ;;
    required_joins: [view_04365]
  }

  join: view_04367 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04363.category} = ${view_04367.category} ;;
  }

  access_filter: {
    field: view_04363.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04363.is_deleted} = false ;;
}
