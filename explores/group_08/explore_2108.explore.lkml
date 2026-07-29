# Explore: explore_2108
# Auto-generated LookML Explore File

include: "/views/domain_25/view_06325.view.lkml"
include: "/views/domain_27/view_06327.view.lkml"
include: "/views/domain_28/view_06328.view.lkml"
include: "/views/domain_29/view_06329.view.lkml"

explore: explore_2108 {
  label: "Explore Explore 2108"
  description: "Comprehensive analytics explore joining base view_06325 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06325
  
  always_filter: {
    filters: [view_06325.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06325.created_at_date: "7 days"]
    unless: [view_06325.id, view_06325.status]
  }

  join: view_06327 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06325.user_id} = ${view_06327.id} ;;
    required_joins: []
  }

  join: view_06328 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06325.account_id} = ${view_06328.account_id} ;;
    required_joins: [view_06327]
  }

  join: view_06329 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06325.category} = ${view_06329.category} ;;
  }

  access_filter: {
    field: view_06325.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06325.is_deleted} = false ;;
}
