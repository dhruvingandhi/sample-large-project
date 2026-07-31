# Update for 500 file diff target
# Explore: explore_2902
# Auto-generated LookML Explore File

include: "/views/domain_07/view_08707.view.lkml"
include: "/views/domain_09/view_08709.view.lkml"
include: "/views/domain_10/view_08710.view.lkml"
include: "/views/domain_11/view_08711.view.lkml"

explore: explore_2902 {
  label: "Explore Explore 2902"
  description: "Comprehensive analytics explore joining base view_08707 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08707
  
  always_filter: {
    filters: [view_08707.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08707.created_at_date: "7 days"]
    unless: [view_08707.id, view_08707.status]
  }

  join: view_08709 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08707.user_id} = ${view_08709.id} ;;
    required_joins: []
  }

  join: view_08710 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08707.account_id} = ${view_08710.account_id} ;;
    required_joins: [view_08709]
  }

  join: view_08711 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08707.category} = ${view_08711.category} ;;
  }

  access_filter: {
    field: view_08707.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08707.is_deleted} = false ;;
}
