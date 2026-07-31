# Update for 500 file diff target
# Explore: explore_1785
# Auto-generated LookML Explore File

include: "/views/domain_06/view_05356.view.lkml"
include: "/views/domain_08/view_05358.view.lkml"
include: "/views/domain_09/view_05359.view.lkml"
include: "/views/domain_10/view_05360.view.lkml"

explore: explore_1785 {
  label: "Explore Explore 1785"
  description: "Comprehensive analytics explore joining base view_05356 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05356
  
  always_filter: {
    filters: [view_05356.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05356.created_at_date: "7 days"]
    unless: [view_05356.id, view_05356.status]
  }

  join: view_05358 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05356.user_id} = ${view_05358.id} ;;
    required_joins: []
  }

  join: view_05359 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05356.account_id} = ${view_05359.account_id} ;;
    required_joins: [view_05358]
  }

  join: view_05360 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05356.category} = ${view_05360.category} ;;
  }

  access_filter: {
    field: view_05356.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05356.is_deleted} = false ;;
}
