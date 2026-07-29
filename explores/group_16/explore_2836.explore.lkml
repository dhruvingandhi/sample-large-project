# Explore: explore_2836
# Auto-generated LookML Explore File

include: "/views/domain_09/view_08509.view.lkml"
include: "/views/domain_11/view_08511.view.lkml"
include: "/views/domain_12/view_08512.view.lkml"
include: "/views/domain_13/view_08513.view.lkml"

explore: explore_2836 {
  label: "Explore Explore 2836"
  description: "Comprehensive analytics explore joining base view_08509 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08509
  
  always_filter: {
    filters: [view_08509.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08509.created_at_date: "7 days"]
    unless: [view_08509.id, view_08509.status]
  }

  join: view_08511 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08509.user_id} = ${view_08511.id} ;;
    required_joins: []
  }

  join: view_08512 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08509.account_id} = ${view_08512.account_id} ;;
    required_joins: [view_08511]
  }

  join: view_08513 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08509.category} = ${view_08513.category} ;;
  }

  access_filter: {
    field: view_08509.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08509.is_deleted} = false ;;
}
