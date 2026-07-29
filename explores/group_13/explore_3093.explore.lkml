# Explore: explore_3093
# Auto-generated LookML Explore File

include: "/views/domain_30/view_09280.view.lkml"
include: "/views/domain_32/view_09282.view.lkml"
include: "/views/domain_33/view_09283.view.lkml"
include: "/views/domain_34/view_09284.view.lkml"

explore: explore_3093 {
  label: "Explore Explore 3093"
  description: "Comprehensive analytics explore joining base view_09280 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09280
  
  always_filter: {
    filters: [view_09280.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09280.created_at_date: "7 days"]
    unless: [view_09280.id, view_09280.status]
  }

  join: view_09282 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09280.user_id} = ${view_09282.id} ;;
    required_joins: []
  }

  join: view_09283 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09280.account_id} = ${view_09283.account_id} ;;
    required_joins: [view_09282]
  }

  join: view_09284 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09280.category} = ${view_09284.category} ;;
  }

  access_filter: {
    field: view_09280.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09280.is_deleted} = false ;;
}
