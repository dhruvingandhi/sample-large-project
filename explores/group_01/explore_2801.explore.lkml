# Explore: explore_2801
# Auto-generated LookML Explore File

include: "/views/domain_04/view_08404.view.lkml"
include: "/views/domain_06/view_08406.view.lkml"
include: "/views/domain_07/view_08407.view.lkml"
include: "/views/domain_08/view_08408.view.lkml"

explore: explore_2801 {
  label: "Explore Explore 2801"
  description: "Comprehensive analytics explore joining base view_08404 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08404
  
  always_filter: {
    filters: [view_08404.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08404.created_at_date: "7 days"]
    unless: [view_08404.id, view_08404.status]
  }

  join: view_08406 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08404.user_id} = ${view_08406.id} ;;
    required_joins: []
  }

  join: view_08407 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08404.account_id} = ${view_08407.account_id} ;;
    required_joins: [view_08406]
  }

  join: view_08408 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08404.category} = ${view_08408.category} ;;
  }

  access_filter: {
    field: view_08404.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08404.is_deleted} = false ;;
}
