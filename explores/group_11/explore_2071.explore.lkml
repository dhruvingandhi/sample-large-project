# Explore: explore_2071
# Auto-generated LookML Explore File

include: "/views/domain_14/view_06214.view.lkml"
include: "/views/domain_16/view_06216.view.lkml"
include: "/views/domain_17/view_06217.view.lkml"
include: "/views/domain_18/view_06218.view.lkml"

explore: explore_2071 {
  label: "Explore Explore 2071"
  description: "Comprehensive analytics explore joining base view_06214 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06214
  
  always_filter: {
    filters: [view_06214.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06214.created_at_date: "7 days"]
    unless: [view_06214.id, view_06214.status]
  }

  join: view_06216 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06214.user_id} = ${view_06216.id} ;;
    required_joins: []
  }

  join: view_06217 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06214.account_id} = ${view_06217.account_id} ;;
    required_joins: [view_06216]
  }

  join: view_06218 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06214.category} = ${view_06218.category} ;;
  }

  access_filter: {
    field: view_06214.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06214.is_deleted} = false ;;
}
