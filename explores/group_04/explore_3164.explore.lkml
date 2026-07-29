# Explore: explore_3164
# Auto-generated LookML Explore File

include: "/views/domain_43/view_09493.view.lkml"
include: "/views/domain_45/view_09495.view.lkml"
include: "/views/domain_46/view_09496.view.lkml"
include: "/views/domain_47/view_09497.view.lkml"

explore: explore_3164 {
  label: "Explore Explore 3164"
  description: "Comprehensive analytics explore joining base view_09493 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09493
  
  always_filter: {
    filters: [view_09493.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09493.created_at_date: "7 days"]
    unless: [view_09493.id, view_09493.status]
  }

  join: view_09495 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09493.user_id} = ${view_09495.id} ;;
    required_joins: []
  }

  join: view_09496 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09493.account_id} = ${view_09496.account_id} ;;
    required_joins: [view_09495]
  }

  join: view_09497 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09493.category} = ${view_09497.category} ;;
  }

  access_filter: {
    field: view_09493.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09493.is_deleted} = false ;;
}
