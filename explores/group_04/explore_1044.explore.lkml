# Explore: explore_1044
# Auto-generated LookML Explore File

include: "/views/domain_33/view_03133.view.lkml"
include: "/views/domain_35/view_03135.view.lkml"
include: "/views/domain_36/view_03136.view.lkml"
include: "/views/domain_37/view_03137.view.lkml"

explore: explore_1044 {
  label: "Explore Explore 1044"
  description: "Comprehensive analytics explore joining base view_03133 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03133
  
  always_filter: {
    filters: [view_03133.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03133.created_at_date: "7 days"]
    unless: [view_03133.id, view_03133.status]
  }

  join: view_03135 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03133.user_id} = ${view_03135.id} ;;
    required_joins: []
  }

  join: view_03136 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03133.account_id} = ${view_03136.account_id} ;;
    required_joins: [view_03135]
  }

  join: view_03137 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03133.category} = ${view_03137.category} ;;
  }

  access_filter: {
    field: view_03133.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03133.is_deleted} = false ;;
}
