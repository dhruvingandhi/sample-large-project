# Explore: explore_3569
# Auto-generated LookML Explore File

include: "/views/domain_08/view_10708.view.lkml"
include: "/views/domain_10/view_10710.view.lkml"
include: "/views/domain_11/view_10711.view.lkml"
include: "/views/domain_12/view_10712.view.lkml"

explore: explore_3569 {
  label: "Explore Explore 3569"
  description: "Comprehensive analytics explore joining base view_10708 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10708
  
  always_filter: {
    filters: [view_10708.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10708.created_at_date: "7 days"]
    unless: [view_10708.id, view_10708.status]
  }

  join: view_10710 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10708.user_id} = ${view_10710.id} ;;
    required_joins: []
  }

  join: view_10711 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10708.account_id} = ${view_10711.account_id} ;;
    required_joins: [view_10710]
  }

  join: view_10712 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10708.category} = ${view_10712.category} ;;
  }

  access_filter: {
    field: view_10708.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10708.is_deleted} = false ;;
}
