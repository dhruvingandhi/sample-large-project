# Explore: explore_3801
# Auto-generated LookML Explore File

include: "/views/domain_04/view_11404.view.lkml"
include: "/views/domain_06/view_11406.view.lkml"
include: "/views/domain_07/view_11407.view.lkml"
include: "/views/domain_08/view_11408.view.lkml"

explore: explore_3801 {
  label: "Explore Explore 3801"
  description: "Comprehensive analytics explore joining base view_11404 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11404
  
  always_filter: {
    filters: [view_11404.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11404.created_at_date: "7 days"]
    unless: [view_11404.id, view_11404.status]
  }

  join: view_11406 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11404.user_id} = ${view_11406.id} ;;
    required_joins: []
  }

  join: view_11407 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11404.account_id} = ${view_11407.account_id} ;;
    required_joins: [view_11406]
  }

  join: view_11408 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11404.category} = ${view_11408.category} ;;
  }

  access_filter: {
    field: view_11404.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11404.is_deleted} = false ;;
}
