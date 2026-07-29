# Explore: explore_1084
# Auto-generated LookML Explore File

include: "/views/domain_03/view_03253.view.lkml"
include: "/views/domain_05/view_03255.view.lkml"
include: "/views/domain_06/view_03256.view.lkml"
include: "/views/domain_07/view_03257.view.lkml"

explore: explore_1084 {
  label: "Explore Explore 1084"
  description: "Comprehensive analytics explore joining base view_03253 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03253
  
  always_filter: {
    filters: [view_03253.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03253.created_at_date: "7 days"]
    unless: [view_03253.id, view_03253.status]
  }

  join: view_03255 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03253.user_id} = ${view_03255.id} ;;
    required_joins: []
  }

  join: view_03256 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03253.account_id} = ${view_03256.account_id} ;;
    required_joins: [view_03255]
  }

  join: view_03257 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03253.category} = ${view_03257.category} ;;
  }

  access_filter: {
    field: view_03253.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03253.is_deleted} = false ;;
}
