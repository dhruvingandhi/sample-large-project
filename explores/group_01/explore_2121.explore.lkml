# Explore: explore_2121
# Auto-generated LookML Explore File

include: "/views/domain_14/view_06364.view.lkml"
include: "/views/domain_16/view_06366.view.lkml"
include: "/views/domain_17/view_06367.view.lkml"
include: "/views/domain_18/view_06368.view.lkml"

explore: explore_2121 {
  label: "Explore Explore 2121"
  description: "Comprehensive analytics explore joining base view_06364 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06364
  
  always_filter: {
    filters: [view_06364.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06364.created_at_date: "7 days"]
    unless: [view_06364.id, view_06364.status]
  }

  join: view_06366 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06364.user_id} = ${view_06366.id} ;;
    required_joins: []
  }

  join: view_06367 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06364.account_id} = ${view_06367.account_id} ;;
    required_joins: [view_06366]
  }

  join: view_06368 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06364.category} = ${view_06368.category} ;;
  }

  access_filter: {
    field: view_06364.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06364.is_deleted} = false ;;
}
