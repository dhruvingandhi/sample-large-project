# Explore: explore_3836
# Auto-generated LookML Explore File

include: "/views/domain_09/view_11509.view.lkml"
include: "/views/domain_11/view_11511.view.lkml"
include: "/views/domain_12/view_11512.view.lkml"
include: "/views/domain_13/view_11513.view.lkml"

explore: explore_3836 {
  label: "Explore Explore 3836"
  description: "Comprehensive analytics explore joining base view_11509 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11509
  
  always_filter: {
    filters: [view_11509.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11509.created_at_date: "7 days"]
    unless: [view_11509.id, view_11509.status]
  }

  join: view_11511 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11509.user_id} = ${view_11511.id} ;;
    required_joins: []
  }

  join: view_11512 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11509.account_id} = ${view_11512.account_id} ;;
    required_joins: [view_11511]
  }

  join: view_11513 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11509.category} = ${view_11513.category} ;;
  }

  access_filter: {
    field: view_11509.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11509.is_deleted} = false ;;
}
