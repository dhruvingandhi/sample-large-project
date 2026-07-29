# Explore: explore_1366
# Auto-generated LookML Explore File

include: "/views/domain_49/view_04099.view.lkml"
include: "/views/domain_01/view_04101.view.lkml"
include: "/views/domain_02/view_04102.view.lkml"
include: "/views/domain_03/view_04103.view.lkml"

explore: explore_1366 {
  label: "Explore Explore 1366"
  description: "Comprehensive analytics explore joining base view_04099 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04099
  
  always_filter: {
    filters: [view_04099.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04099.created_at_date: "7 days"]
    unless: [view_04099.id, view_04099.status]
  }

  join: view_04101 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04099.user_id} = ${view_04101.id} ;;
    required_joins: []
  }

  join: view_04102 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04099.account_id} = ${view_04102.account_id} ;;
    required_joins: [view_04101]
  }

  join: view_04103 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04099.category} = ${view_04103.category} ;;
  }

  access_filter: {
    field: view_04099.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04099.is_deleted} = false ;;
}
