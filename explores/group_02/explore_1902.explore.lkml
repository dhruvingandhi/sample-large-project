# Explore: explore_1902
# Auto-generated LookML Explore File

include: "/views/domain_07/view_05707.view.lkml"
include: "/views/domain_09/view_05709.view.lkml"
include: "/views/domain_10/view_05710.view.lkml"
include: "/views/domain_11/view_05711.view.lkml"

explore: explore_1902 {
  label: "Explore Explore 1902"
  description: "Comprehensive analytics explore joining base view_05707 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05707
  
  always_filter: {
    filters: [view_05707.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05707.created_at_date: "7 days"]
    unless: [view_05707.id, view_05707.status]
  }

  join: view_05709 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05707.user_id} = ${view_05709.id} ;;
    required_joins: []
  }

  join: view_05710 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05707.account_id} = ${view_05710.account_id} ;;
    required_joins: [view_05709]
  }

  join: view_05711 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05707.category} = ${view_05711.category} ;;
  }

  access_filter: {
    field: view_05707.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05707.is_deleted} = false ;;
}
