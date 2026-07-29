# Explore: explore_0151
# Auto-generated LookML Explore File

include: "/views/domain_04/view_00454.view.lkml"
include: "/views/domain_06/view_00456.view.lkml"
include: "/views/domain_07/view_00457.view.lkml"
include: "/views/domain_08/view_00458.view.lkml"

explore: explore_0151 {
  label: "Explore Explore 0151"
  description: "Comprehensive analytics explore joining base view_00454 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00454
  
  always_filter: {
    filters: [view_00454.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00454.created_at_date: "7 days"]
    unless: [view_00454.id, view_00454.status]
  }

  join: view_00456 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00454.user_id} = ${view_00456.id} ;;
    required_joins: []
  }

  join: view_00457 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00454.account_id} = ${view_00457.account_id} ;;
    required_joins: [view_00456]
  }

  join: view_00458 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00454.category} = ${view_00458.category} ;;
  }

  access_filter: {
    field: view_00454.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00454.is_deleted} = false ;;
}
