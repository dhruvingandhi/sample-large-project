# Explore: explore_0054
# Auto-generated LookML Explore File

include: "/views/domain_13/view_00163.view.lkml"
include: "/views/domain_15/view_00165.view.lkml"
include: "/views/domain_16/view_00166.view.lkml"
include: "/views/domain_17/view_00167.view.lkml"

explore: explore_0054 {
  label: "Explore Explore 0054"
  description: "Comprehensive analytics explore joining base view_00163 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00163
  
  always_filter: {
    filters: [view_00163.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00163.created_at_date: "7 days"]
    unless: [view_00163.id, view_00163.status]
  }

  join: view_00165 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00163.user_id} = ${view_00165.id} ;;
    required_joins: []
  }

  join: view_00166 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00163.account_id} = ${view_00166.account_id} ;;
    required_joins: [view_00165]
  }

  join: view_00167 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00163.category} = ${view_00167.category} ;;
  }

  access_filter: {
    field: view_00163.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00163.is_deleted} = false ;;
}
