# Explore: explore_1569
# Auto-generated LookML Explore File

include: "/views/domain_08/view_04708.view.lkml"
include: "/views/domain_10/view_04710.view.lkml"
include: "/views/domain_11/view_04711.view.lkml"
include: "/views/domain_12/view_04712.view.lkml"

explore: explore_1569 {
  label: "Explore Explore 1569"
  description: "Comprehensive analytics explore joining base view_04708 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04708
  
  always_filter: {
    filters: [view_04708.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04708.created_at_date: "7 days"]
    unless: [view_04708.id, view_04708.status]
  }

  join: view_04710 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04708.user_id} = ${view_04710.id} ;;
    required_joins: []
  }

  join: view_04711 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04708.account_id} = ${view_04711.account_id} ;;
    required_joins: [view_04710]
  }

  join: view_04712 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04708.category} = ${view_04712.category} ;;
  }

  access_filter: {
    field: view_04708.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04708.is_deleted} = false ;;
}
