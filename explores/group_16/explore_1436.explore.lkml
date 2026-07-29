# Explore: explore_1436
# Auto-generated LookML Explore File

include: "/views/domain_09/view_04309.view.lkml"
include: "/views/domain_11/view_04311.view.lkml"
include: "/views/domain_12/view_04312.view.lkml"
include: "/views/domain_13/view_04313.view.lkml"

explore: explore_1436 {
  label: "Explore Explore 1436"
  description: "Comprehensive analytics explore joining base view_04309 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04309
  
  always_filter: {
    filters: [view_04309.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04309.created_at_date: "7 days"]
    unless: [view_04309.id, view_04309.status]
  }

  join: view_04311 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04309.user_id} = ${view_04311.id} ;;
    required_joins: []
  }

  join: view_04312 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04309.account_id} = ${view_04312.account_id} ;;
    required_joins: [view_04311]
  }

  join: view_04313 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04309.category} = ${view_04313.category} ;;
  }

  access_filter: {
    field: view_04309.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04309.is_deleted} = false ;;
}
