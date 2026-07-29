# Explore: explore_2175
# Auto-generated LookML Explore File

include: "/views/domain_26/view_06526.view.lkml"
include: "/views/domain_28/view_06528.view.lkml"
include: "/views/domain_29/view_06529.view.lkml"
include: "/views/domain_30/view_06530.view.lkml"

explore: explore_2175 {
  label: "Explore Explore 2175"
  description: "Comprehensive analytics explore joining base view_06526 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06526
  
  always_filter: {
    filters: [view_06526.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06526.created_at_date: "7 days"]
    unless: [view_06526.id, view_06526.status]
  }

  join: view_06528 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06526.user_id} = ${view_06528.id} ;;
    required_joins: []
  }

  join: view_06529 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06526.account_id} = ${view_06529.account_id} ;;
    required_joins: [view_06528]
  }

  join: view_06530 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06526.category} = ${view_06530.category} ;;
  }

  access_filter: {
    field: view_06526.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06526.is_deleted} = false ;;
}
