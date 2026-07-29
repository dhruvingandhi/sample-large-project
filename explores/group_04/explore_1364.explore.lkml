# Explore: explore_1364
# Auto-generated LookML Explore File

include: "/views/domain_43/view_04093.view.lkml"
include: "/views/domain_45/view_04095.view.lkml"
include: "/views/domain_46/view_04096.view.lkml"
include: "/views/domain_47/view_04097.view.lkml"

explore: explore_1364 {
  label: "Explore Explore 1364"
  description: "Comprehensive analytics explore joining base view_04093 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04093
  
  always_filter: {
    filters: [view_04093.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04093.created_at_date: "7 days"]
    unless: [view_04093.id, view_04093.status]
  }

  join: view_04095 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04093.user_id} = ${view_04095.id} ;;
    required_joins: []
  }

  join: view_04096 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04093.account_id} = ${view_04096.account_id} ;;
    required_joins: [view_04095]
  }

  join: view_04097 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04093.category} = ${view_04097.category} ;;
  }

  access_filter: {
    field: view_04093.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04093.is_deleted} = false ;;
}
