# Explore: explore_1776
# Auto-generated LookML Explore File

include: "/views/domain_29/view_05329.view.lkml"
include: "/views/domain_31/view_05331.view.lkml"
include: "/views/domain_32/view_05332.view.lkml"
include: "/views/domain_33/view_05333.view.lkml"

explore: explore_1776 {
  label: "Explore Explore 1776"
  description: "Comprehensive analytics explore joining base view_05329 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05329
  
  always_filter: {
    filters: [view_05329.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05329.created_at_date: "7 days"]
    unless: [view_05329.id, view_05329.status]
  }

  join: view_05331 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05329.user_id} = ${view_05331.id} ;;
    required_joins: []
  }

  join: view_05332 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05329.account_id} = ${view_05332.account_id} ;;
    required_joins: [view_05331]
  }

  join: view_05333 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05329.category} = ${view_05333.category} ;;
  }

  access_filter: {
    field: view_05329.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05329.is_deleted} = false ;;
}
