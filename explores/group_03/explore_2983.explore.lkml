# Explore: explore_2983
# Auto-generated LookML Explore File

include: "/views/domain_50/view_08950.view.lkml"
include: "/views/domain_02/view_08952.view.lkml"
include: "/views/domain_03/view_08953.view.lkml"
include: "/views/domain_04/view_08954.view.lkml"

explore: explore_2983 {
  label: "Explore Explore 2983"
  description: "Comprehensive analytics explore joining base view_08950 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08950
  
  always_filter: {
    filters: [view_08950.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08950.created_at_date: "7 days"]
    unless: [view_08950.id, view_08950.status]
  }

  join: view_08952 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08950.user_id} = ${view_08952.id} ;;
    required_joins: []
  }

  join: view_08953 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08950.account_id} = ${view_08953.account_id} ;;
    required_joins: [view_08952]
  }

  join: view_08954 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08950.category} = ${view_08954.category} ;;
  }

  access_filter: {
    field: view_08950.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08950.is_deleted} = false ;;
}
