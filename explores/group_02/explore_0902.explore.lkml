# Explore: explore_0902
# Auto-generated LookML Explore File

include: "/views/domain_07/view_02707.view.lkml"
include: "/views/domain_09/view_02709.view.lkml"
include: "/views/domain_10/view_02710.view.lkml"
include: "/views/domain_11/view_02711.view.lkml"

explore: explore_0902 {
  label: "Explore Explore 0902"
  description: "Comprehensive analytics explore joining base view_02707 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02707
  
  always_filter: {
    filters: [view_02707.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02707.created_at_date: "7 days"]
    unless: [view_02707.id, view_02707.status]
  }

  join: view_02709 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02707.user_id} = ${view_02709.id} ;;
    required_joins: []
  }

  join: view_02710 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02707.account_id} = ${view_02710.account_id} ;;
    required_joins: [view_02709]
  }

  join: view_02711 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02707.category} = ${view_02711.category} ;;
  }

  access_filter: {
    field: view_02707.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02707.is_deleted} = false ;;
}
