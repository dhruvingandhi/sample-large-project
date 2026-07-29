# Explore: explore_1121
# Auto-generated LookML Explore File

include: "/views/domain_14/view_03364.view.lkml"
include: "/views/domain_16/view_03366.view.lkml"
include: "/views/domain_17/view_03367.view.lkml"
include: "/views/domain_18/view_03368.view.lkml"

explore: explore_1121 {
  label: "Explore Explore 1121"
  description: "Comprehensive analytics explore joining base view_03364 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03364
  
  always_filter: {
    filters: [view_03364.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03364.created_at_date: "7 days"]
    unless: [view_03364.id, view_03364.status]
  }

  join: view_03366 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03364.user_id} = ${view_03366.id} ;;
    required_joins: []
  }

  join: view_03367 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03364.account_id} = ${view_03367.account_id} ;;
    required_joins: [view_03366]
  }

  join: view_03368 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03364.category} = ${view_03368.category} ;;
  }

  access_filter: {
    field: view_03364.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03364.is_deleted} = false ;;
}
