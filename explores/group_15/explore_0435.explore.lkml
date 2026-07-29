# Explore: explore_0435
# Auto-generated LookML Explore File

include: "/views/domain_06/view_01306.view.lkml"
include: "/views/domain_08/view_01308.view.lkml"
include: "/views/domain_09/view_01309.view.lkml"
include: "/views/domain_10/view_01310.view.lkml"

explore: explore_0435 {
  label: "Explore Explore 0435"
  description: "Comprehensive analytics explore joining base view_01306 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01306
  
  always_filter: {
    filters: [view_01306.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01306.created_at_date: "7 days"]
    unless: [view_01306.id, view_01306.status]
  }

  join: view_01308 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01306.user_id} = ${view_01308.id} ;;
    required_joins: []
  }

  join: view_01309 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01306.account_id} = ${view_01309.account_id} ;;
    required_joins: [view_01308]
  }

  join: view_01310 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01306.category} = ${view_01310.category} ;;
  }

  access_filter: {
    field: view_01306.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01306.is_deleted} = false ;;
}
