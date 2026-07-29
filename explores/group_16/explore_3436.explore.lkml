# Explore: explore_3436
# Auto-generated LookML Explore File

include: "/views/domain_09/view_10309.view.lkml"
include: "/views/domain_11/view_10311.view.lkml"
include: "/views/domain_12/view_10312.view.lkml"
include: "/views/domain_13/view_10313.view.lkml"

explore: explore_3436 {
  label: "Explore Explore 3436"
  description: "Comprehensive analytics explore joining base view_10309 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10309
  
  always_filter: {
    filters: [view_10309.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10309.created_at_date: "7 days"]
    unless: [view_10309.id, view_10309.status]
  }

  join: view_10311 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10309.user_id} = ${view_10311.id} ;;
    required_joins: []
  }

  join: view_10312 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10309.account_id} = ${view_10312.account_id} ;;
    required_joins: [view_10311]
  }

  join: view_10313 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10309.category} = ${view_10313.category} ;;
  }

  access_filter: {
    field: view_10309.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10309.is_deleted} = false ;;
}
