# Explore: explore_2086
# Auto-generated LookML Explore File

include: "/views/domain_09/view_06259.view.lkml"
include: "/views/domain_11/view_06261.view.lkml"
include: "/views/domain_12/view_06262.view.lkml"
include: "/views/domain_13/view_06263.view.lkml"

explore: explore_2086 {
  label: "Explore Explore 2086"
  description: "Comprehensive analytics explore joining base view_06259 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06259
  
  always_filter: {
    filters: [view_06259.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06259.created_at_date: "7 days"]
    unless: [view_06259.id, view_06259.status]
  }

  join: view_06261 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06259.user_id} = ${view_06261.id} ;;
    required_joins: []
  }

  join: view_06262 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06259.account_id} = ${view_06262.account_id} ;;
    required_joins: [view_06261]
  }

  join: view_06263 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06259.category} = ${view_06263.category} ;;
  }

  access_filter: {
    field: view_06259.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06259.is_deleted} = false ;;
}
