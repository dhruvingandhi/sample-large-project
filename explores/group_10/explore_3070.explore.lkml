# Explore: explore_3070
# Auto-generated LookML Explore File

include: "/views/domain_11/view_09211.view.lkml"
include: "/views/domain_13/view_09213.view.lkml"
include: "/views/domain_14/view_09214.view.lkml"
include: "/views/domain_15/view_09215.view.lkml"

explore: explore_3070 {
  label: "Explore Explore 3070"
  description: "Comprehensive analytics explore joining base view_09211 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09211
  
  always_filter: {
    filters: [view_09211.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09211.created_at_date: "7 days"]
    unless: [view_09211.id, view_09211.status]
  }

  join: view_09213 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09211.user_id} = ${view_09213.id} ;;
    required_joins: []
  }

  join: view_09214 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09211.account_id} = ${view_09214.account_id} ;;
    required_joins: [view_09213]
  }

  join: view_09215 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09211.category} = ${view_09215.category} ;;
  }

  access_filter: {
    field: view_09211.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09211.is_deleted} = false ;;
}
