# Explore: explore_0084
# Auto-generated LookML Explore File

include: "/views/domain_03/view_00253.view.lkml"
include: "/views/domain_05/view_00255.view.lkml"
include: "/views/domain_06/view_00256.view.lkml"
include: "/views/domain_07/view_00257.view.lkml"

explore: explore_0084 {
  label: "Explore Explore 0084"
  description: "Comprehensive analytics explore joining base view_00253 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00253
  
  always_filter: {
    filters: [view_00253.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00253.created_at_date: "7 days"]
    unless: [view_00253.id, view_00253.status]
  }

  join: view_00255 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00253.user_id} = ${view_00255.id} ;;
    required_joins: []
  }

  join: view_00256 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00253.account_id} = ${view_00256.account_id} ;;
    required_joins: [view_00255]
  }

  join: view_00257 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00253.category} = ${view_00257.category} ;;
  }

  access_filter: {
    field: view_00253.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00253.is_deleted} = false ;;
}
