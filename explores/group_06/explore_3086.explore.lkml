# Explore: explore_3086
# Auto-generated LookML Explore File

include: "/views/domain_09/view_09259.view.lkml"
include: "/views/domain_11/view_09261.view.lkml"
include: "/views/domain_12/view_09262.view.lkml"
include: "/views/domain_13/view_09263.view.lkml"

explore: explore_3086 {
  label: "Explore Explore 3086"
  description: "Comprehensive analytics explore joining base view_09259 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09259
  
  always_filter: {
    filters: [view_09259.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09259.created_at_date: "7 days"]
    unless: [view_09259.id, view_09259.status]
  }

  join: view_09261 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09259.user_id} = ${view_09261.id} ;;
    required_joins: []
  }

  join: view_09262 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09259.account_id} = ${view_09262.account_id} ;;
    required_joins: [view_09261]
  }

  join: view_09263 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09259.category} = ${view_09263.category} ;;
  }

  access_filter: {
    field: view_09259.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09259.is_deleted} = false ;;
}
