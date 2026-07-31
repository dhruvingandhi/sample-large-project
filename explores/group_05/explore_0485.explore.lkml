# Antigravity modified: branch dg-3
# Explore: explore_0485
# Auto-generated LookML Explore File

include: "/views/domain_06/view_01456.view.lkml"
include: "/views/domain_08/view_01458.view.lkml"
include: "/views/domain_09/view_01459.view.lkml"
include: "/views/domain_10/view_01460.view.lkml"

explore: explore_0485 {
  label: "Explore Explore 0485"
  description: "Comprehensive analytics explore joining base view_01456 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01456
  
  always_filter: {
    filters: [view_01456.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01456.created_at_date: "7 days"]
    unless: [view_01456.id, view_01456.status]
  }

  join: view_01458 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01456.user_id} = ${view_01458.id} ;;
    required_joins: []
  }

  join: view_01459 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01456.account_id} = ${view_01459.account_id} ;;
    required_joins: [view_01458]
  }

  join: view_01460 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01456.category} = ${view_01460.category} ;;
  }

  access_filter: {
    field: view_01456.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01456.is_deleted} = false ;;
}
