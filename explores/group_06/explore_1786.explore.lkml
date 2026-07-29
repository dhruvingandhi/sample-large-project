# Explore: explore_1786
# Auto-generated LookML Explore File

include: "/views/domain_09/view_05359.view.lkml"
include: "/views/domain_11/view_05361.view.lkml"
include: "/views/domain_12/view_05362.view.lkml"
include: "/views/domain_13/view_05363.view.lkml"

explore: explore_1786 {
  label: "Explore Explore 1786"
  description: "Comprehensive analytics explore joining base view_05359 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05359
  
  always_filter: {
    filters: [view_05359.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05359.created_at_date: "7 days"]
    unless: [view_05359.id, view_05359.status]
  }

  join: view_05361 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05359.user_id} = ${view_05361.id} ;;
    required_joins: []
  }

  join: view_05362 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05359.account_id} = ${view_05362.account_id} ;;
    required_joins: [view_05361]
  }

  join: view_05363 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05359.category} = ${view_05363.category} ;;
  }

  access_filter: {
    field: view_05359.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05359.is_deleted} = false ;;
}
