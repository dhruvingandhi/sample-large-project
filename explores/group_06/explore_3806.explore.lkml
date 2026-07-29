# Explore: explore_3806
# Auto-generated LookML Explore File

include: "/views/domain_19/view_11419.view.lkml"
include: "/views/domain_21/view_11421.view.lkml"
include: "/views/domain_22/view_11422.view.lkml"
include: "/views/domain_23/view_11423.view.lkml"

explore: explore_3806 {
  label: "Explore Explore 3806"
  description: "Comprehensive analytics explore joining base view_11419 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11419
  
  always_filter: {
    filters: [view_11419.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11419.created_at_date: "7 days"]
    unless: [view_11419.id, view_11419.status]
  }

  join: view_11421 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11419.user_id} = ${view_11421.id} ;;
    required_joins: []
  }

  join: view_11422 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11419.account_id} = ${view_11422.account_id} ;;
    required_joins: [view_11421]
  }

  join: view_11423 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11419.category} = ${view_11423.category} ;;
  }

  access_filter: {
    field: view_11419.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11419.is_deleted} = false ;;
}
