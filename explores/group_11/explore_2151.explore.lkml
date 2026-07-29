# Explore: explore_2151
# Auto-generated LookML Explore File

include: "/views/domain_04/view_06454.view.lkml"
include: "/views/domain_06/view_06456.view.lkml"
include: "/views/domain_07/view_06457.view.lkml"
include: "/views/domain_08/view_06458.view.lkml"

explore: explore_2151 {
  label: "Explore Explore 2151"
  description: "Comprehensive analytics explore joining base view_06454 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06454
  
  always_filter: {
    filters: [view_06454.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06454.created_at_date: "7 days"]
    unless: [view_06454.id, view_06454.status]
  }

  join: view_06456 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06454.user_id} = ${view_06456.id} ;;
    required_joins: []
  }

  join: view_06457 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06454.account_id} = ${view_06457.account_id} ;;
    required_joins: [view_06456]
  }

  join: view_06458 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06454.category} = ${view_06458.category} ;;
  }

  access_filter: {
    field: view_06454.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06454.is_deleted} = false ;;
}
