# Explore: explore_1123
# Auto-generated LookML Explore File

include: "/views/domain_20/view_03370.view.lkml"
include: "/views/domain_22/view_03372.view.lkml"
include: "/views/domain_23/view_03373.view.lkml"
include: "/views/domain_24/view_03374.view.lkml"

explore: explore_1123 {
  label: "Explore Explore 1123"
  description: "Comprehensive analytics explore joining base view_03370 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03370
  
  always_filter: {
    filters: [view_03370.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03370.created_at_date: "7 days"]
    unless: [view_03370.id, view_03370.status]
  }

  join: view_03372 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03370.user_id} = ${view_03372.id} ;;
    required_joins: []
  }

  join: view_03373 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03370.account_id} = ${view_03373.account_id} ;;
    required_joins: [view_03372]
  }

  join: view_03374 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03370.category} = ${view_03374.category} ;;
  }

  access_filter: {
    field: view_03370.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03370.is_deleted} = false ;;
}
