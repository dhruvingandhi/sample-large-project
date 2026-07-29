# Explore: explore_0453
# Auto-generated LookML Explore File

include: "/views/domain_10/view_01360.view.lkml"
include: "/views/domain_12/view_01362.view.lkml"
include: "/views/domain_13/view_01363.view.lkml"
include: "/views/domain_14/view_01364.view.lkml"

explore: explore_0453 {
  label: "Explore Explore 0453"
  description: "Comprehensive analytics explore joining base view_01360 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01360
  
  always_filter: {
    filters: [view_01360.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01360.created_at_date: "7 days"]
    unless: [view_01360.id, view_01360.status]
  }

  join: view_01362 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01360.user_id} = ${view_01362.id} ;;
    required_joins: []
  }

  join: view_01363 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01360.account_id} = ${view_01363.account_id} ;;
    required_joins: [view_01362]
  }

  join: view_01364 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01360.category} = ${view_01364.category} ;;
  }

  access_filter: {
    field: view_01360.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01360.is_deleted} = false ;;
}
