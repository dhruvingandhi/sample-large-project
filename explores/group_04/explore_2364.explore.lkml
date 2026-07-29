# Explore: explore_2364
# Auto-generated LookML Explore File

include: "/views/domain_43/view_07093.view.lkml"
include: "/views/domain_45/view_07095.view.lkml"
include: "/views/domain_46/view_07096.view.lkml"
include: "/views/domain_47/view_07097.view.lkml"

explore: explore_2364 {
  label: "Explore Explore 2364"
  description: "Comprehensive analytics explore joining base view_07093 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07093
  
  always_filter: {
    filters: [view_07093.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07093.created_at_date: "7 days"]
    unless: [view_07093.id, view_07093.status]
  }

  join: view_07095 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07093.user_id} = ${view_07095.id} ;;
    required_joins: []
  }

  join: view_07096 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07093.account_id} = ${view_07096.account_id} ;;
    required_joins: [view_07095]
  }

  join: view_07097 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07093.category} = ${view_07097.category} ;;
  }

  access_filter: {
    field: view_07093.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07093.is_deleted} = false ;;
}
