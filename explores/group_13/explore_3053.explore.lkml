# Explore: explore_3053
# Auto-generated LookML Explore File

include: "/views/domain_10/view_09160.view.lkml"
include: "/views/domain_12/view_09162.view.lkml"
include: "/views/domain_13/view_09163.view.lkml"
include: "/views/domain_14/view_09164.view.lkml"

explore: explore_3053 {
  label: "Explore Explore 3053"
  description: "Comprehensive analytics explore joining base view_09160 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09160
  
  always_filter: {
    filters: [view_09160.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09160.created_at_date: "7 days"]
    unless: [view_09160.id, view_09160.status]
  }

  join: view_09162 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09160.user_id} = ${view_09162.id} ;;
    required_joins: []
  }

  join: view_09163 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09160.account_id} = ${view_09163.account_id} ;;
    required_joins: [view_09162]
  }

  join: view_09164 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09160.category} = ${view_09164.category} ;;
  }

  access_filter: {
    field: view_09160.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09160.is_deleted} = false ;;
}
