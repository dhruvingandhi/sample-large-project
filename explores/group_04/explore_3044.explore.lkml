# Explore: explore_3044
# Auto-generated LookML Explore File

include: "/views/domain_33/view_09133.view.lkml"
include: "/views/domain_35/view_09135.view.lkml"
include: "/views/domain_36/view_09136.view.lkml"
include: "/views/domain_37/view_09137.view.lkml"

explore: explore_3044 {
  label: "Explore Explore 3044"
  description: "Comprehensive analytics explore joining base view_09133 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09133
  
  always_filter: {
    filters: [view_09133.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09133.created_at_date: "7 days"]
    unless: [view_09133.id, view_09133.status]
  }

  join: view_09135 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09133.user_id} = ${view_09135.id} ;;
    required_joins: []
  }

  join: view_09136 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09133.account_id} = ${view_09136.account_id} ;;
    required_joins: [view_09135]
  }

  join: view_09137 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09133.category} = ${view_09137.category} ;;
  }

  access_filter: {
    field: view_09133.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09133.is_deleted} = false ;;
}
