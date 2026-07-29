# Explore: explore_2453
# Auto-generated LookML Explore File

include: "/views/domain_10/view_07360.view.lkml"
include: "/views/domain_12/view_07362.view.lkml"
include: "/views/domain_13/view_07363.view.lkml"
include: "/views/domain_14/view_07364.view.lkml"

explore: explore_2453 {
  label: "Explore Explore 2453"
  description: "Comprehensive analytics explore joining base view_07360 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07360
  
  always_filter: {
    filters: [view_07360.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07360.created_at_date: "7 days"]
    unless: [view_07360.id, view_07360.status]
  }

  join: view_07362 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07360.user_id} = ${view_07362.id} ;;
    required_joins: []
  }

  join: view_07363 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07360.account_id} = ${view_07363.account_id} ;;
    required_joins: [view_07362]
  }

  join: view_07364 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07360.category} = ${view_07364.category} ;;
  }

  access_filter: {
    field: view_07360.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07360.is_deleted} = false ;;
}
