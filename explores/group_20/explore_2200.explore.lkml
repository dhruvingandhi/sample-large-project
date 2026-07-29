# Explore: explore_2200
# Auto-generated LookML Explore File

include: "/views/domain_01/view_06601.view.lkml"
include: "/views/domain_03/view_06603.view.lkml"
include: "/views/domain_04/view_06604.view.lkml"
include: "/views/domain_05/view_06605.view.lkml"

explore: explore_2200 {
  label: "Explore Explore 2200"
  description: "Comprehensive analytics explore joining base view_06601 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06601
  
  always_filter: {
    filters: [view_06601.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06601.created_at_date: "7 days"]
    unless: [view_06601.id, view_06601.status]
  }

  join: view_06603 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06601.user_id} = ${view_06603.id} ;;
    required_joins: []
  }

  join: view_06604 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06601.account_id} = ${view_06604.account_id} ;;
    required_joins: [view_06603]
  }

  join: view_06605 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06601.category} = ${view_06605.category} ;;
  }

  access_filter: {
    field: view_06601.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06601.is_deleted} = false ;;
}
