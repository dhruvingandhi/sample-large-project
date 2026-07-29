# Explore: explore_1793
# Auto-generated LookML Explore File

include: "/views/domain_30/view_05380.view.lkml"
include: "/views/domain_32/view_05382.view.lkml"
include: "/views/domain_33/view_05383.view.lkml"
include: "/views/domain_34/view_05384.view.lkml"

explore: explore_1793 {
  label: "Explore Explore 1793"
  description: "Comprehensive analytics explore joining base view_05380 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05380
  
  always_filter: {
    filters: [view_05380.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05380.created_at_date: "7 days"]
    unless: [view_05380.id, view_05380.status]
  }

  join: view_05382 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05380.user_id} = ${view_05382.id} ;;
    required_joins: []
  }

  join: view_05383 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05380.account_id} = ${view_05383.account_id} ;;
    required_joins: [view_05382]
  }

  join: view_05384 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05380.category} = ${view_05384.category} ;;
  }

  access_filter: {
    field: view_05380.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05380.is_deleted} = false ;;
}
