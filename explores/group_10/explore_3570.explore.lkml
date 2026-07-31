# Update for 2000 file diff target
# Explore: explore_3570
# Auto-generated LookML Explore File

include: "/views/domain_11/view_10711.view.lkml"
include: "/views/domain_13/view_10713.view.lkml"
include: "/views/domain_14/view_10714.view.lkml"
include: "/views/domain_15/view_10715.view.lkml"

explore: explore_3570 {
  label: "Explore Explore 3570"
  description: "Comprehensive analytics explore joining base view_10711 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10711
  
  always_filter: {
    filters: [view_10711.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10711.created_at_date: "7 days"]
    unless: [view_10711.id, view_10711.status]
  }

  join: view_10713 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10711.user_id} = ${view_10713.id} ;;
    required_joins: []
  }

  join: view_10714 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10711.account_id} = ${view_10714.account_id} ;;
    required_joins: [view_10713]
  }

  join: view_10715 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10711.category} = ${view_10715.category} ;;
  }

  access_filter: {
    field: view_10711.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10711.is_deleted} = false ;;
}
