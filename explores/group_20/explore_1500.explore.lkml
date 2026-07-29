# Explore: explore_1500
# Auto-generated LookML Explore File

include: "/views/domain_01/view_04501.view.lkml"
include: "/views/domain_03/view_04503.view.lkml"
include: "/views/domain_04/view_04504.view.lkml"
include: "/views/domain_05/view_04505.view.lkml"

explore: explore_1500 {
  label: "Explore Explore 1500"
  description: "Comprehensive analytics explore joining base view_04501 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04501
  
  always_filter: {
    filters: [view_04501.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04501.created_at_date: "7 days"]
    unless: [view_04501.id, view_04501.status]
  }

  join: view_04503 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04501.user_id} = ${view_04503.id} ;;
    required_joins: []
  }

  join: view_04504 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04501.account_id} = ${view_04504.account_id} ;;
    required_joins: [view_04503]
  }

  join: view_04505 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04501.category} = ${view_04505.category} ;;
  }

  access_filter: {
    field: view_04501.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04501.is_deleted} = false ;;
}
