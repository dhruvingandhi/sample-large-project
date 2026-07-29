# Explore: explore_0569
# Auto-generated LookML Explore File

include: "/views/domain_08/view_01708.view.lkml"
include: "/views/domain_10/view_01710.view.lkml"
include: "/views/domain_11/view_01711.view.lkml"
include: "/views/domain_12/view_01712.view.lkml"

explore: explore_0569 {
  label: "Explore Explore 0569"
  description: "Comprehensive analytics explore joining base view_01708 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01708
  
  always_filter: {
    filters: [view_01708.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01708.created_at_date: "7 days"]
    unless: [view_01708.id, view_01708.status]
  }

  join: view_01710 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01708.user_id} = ${view_01710.id} ;;
    required_joins: []
  }

  join: view_01711 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01708.account_id} = ${view_01711.account_id} ;;
    required_joins: [view_01710]
  }

  join: view_01712 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01708.category} = ${view_01712.category} ;;
  }

  access_filter: {
    field: view_01708.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01708.is_deleted} = false ;;
}
