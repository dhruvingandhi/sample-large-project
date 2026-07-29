# Explore: explore_2370
# Auto-generated LookML Explore File

include: "/views/domain_11/view_07111.view.lkml"
include: "/views/domain_13/view_07113.view.lkml"
include: "/views/domain_14/view_07114.view.lkml"
include: "/views/domain_15/view_07115.view.lkml"

explore: explore_2370 {
  label: "Explore Explore 2370"
  description: "Comprehensive analytics explore joining base view_07111 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07111
  
  always_filter: {
    filters: [view_07111.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07111.created_at_date: "7 days"]
    unless: [view_07111.id, view_07111.status]
  }

  join: view_07113 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07111.user_id} = ${view_07113.id} ;;
    required_joins: []
  }

  join: view_07114 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07111.account_id} = ${view_07114.account_id} ;;
    required_joins: [view_07113]
  }

  join: view_07115 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07111.category} = ${view_07115.category} ;;
  }

  access_filter: {
    field: view_07111.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07111.is_deleted} = false ;;
}
