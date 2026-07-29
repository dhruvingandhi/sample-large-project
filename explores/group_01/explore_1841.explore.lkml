# Explore: explore_1841
# Auto-generated LookML Explore File

include: "/views/domain_24/view_05524.view.lkml"
include: "/views/domain_26/view_05526.view.lkml"
include: "/views/domain_27/view_05527.view.lkml"
include: "/views/domain_28/view_05528.view.lkml"

explore: explore_1841 {
  label: "Explore Explore 1841"
  description: "Comprehensive analytics explore joining base view_05524 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05524
  
  always_filter: {
    filters: [view_05524.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05524.created_at_date: "7 days"]
    unless: [view_05524.id, view_05524.status]
  }

  join: view_05526 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05524.user_id} = ${view_05526.id} ;;
    required_joins: []
  }

  join: view_05527 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05524.account_id} = ${view_05527.account_id} ;;
    required_joins: [view_05526]
  }

  join: view_05528 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05524.category} = ${view_05528.category} ;;
  }

  access_filter: {
    field: view_05524.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05524.is_deleted} = false ;;
}
