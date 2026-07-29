# Explore: explore_2436
# Auto-generated LookML Explore File

include: "/views/domain_09/view_07309.view.lkml"
include: "/views/domain_11/view_07311.view.lkml"
include: "/views/domain_12/view_07312.view.lkml"
include: "/views/domain_13/view_07313.view.lkml"

explore: explore_2436 {
  label: "Explore Explore 2436"
  description: "Comprehensive analytics explore joining base view_07309 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07309
  
  always_filter: {
    filters: [view_07309.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07309.created_at_date: "7 days"]
    unless: [view_07309.id, view_07309.status]
  }

  join: view_07311 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07309.user_id} = ${view_07311.id} ;;
    required_joins: []
  }

  join: view_07312 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07309.account_id} = ${view_07312.account_id} ;;
    required_joins: [view_07311]
  }

  join: view_07313 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07309.category} = ${view_07313.category} ;;
  }

  access_filter: {
    field: view_07309.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07309.is_deleted} = false ;;
}
