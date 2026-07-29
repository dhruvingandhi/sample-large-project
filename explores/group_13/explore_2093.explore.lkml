# Explore: explore_2093
# Auto-generated LookML Explore File

include: "/views/domain_30/view_06280.view.lkml"
include: "/views/domain_32/view_06282.view.lkml"
include: "/views/domain_33/view_06283.view.lkml"
include: "/views/domain_34/view_06284.view.lkml"

explore: explore_2093 {
  label: "Explore Explore 2093"
  description: "Comprehensive analytics explore joining base view_06280 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06280
  
  always_filter: {
    filters: [view_06280.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06280.created_at_date: "7 days"]
    unless: [view_06280.id, view_06280.status]
  }

  join: view_06282 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06280.user_id} = ${view_06282.id} ;;
    required_joins: []
  }

  join: view_06283 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06280.account_id} = ${view_06283.account_id} ;;
    required_joins: [view_06282]
  }

  join: view_06284 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06280.category} = ${view_06284.category} ;;
  }

  access_filter: {
    field: view_06280.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06280.is_deleted} = false ;;
}
