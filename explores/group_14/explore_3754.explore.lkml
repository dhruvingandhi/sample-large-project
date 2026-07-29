# Explore: explore_3754
# Auto-generated LookML Explore File

include: "/views/domain_13/view_11263.view.lkml"
include: "/views/domain_15/view_11265.view.lkml"
include: "/views/domain_16/view_11266.view.lkml"
include: "/views/domain_17/view_11267.view.lkml"

explore: explore_3754 {
  label: "Explore Explore 3754"
  description: "Comprehensive analytics explore joining base view_11263 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11263
  
  always_filter: {
    filters: [view_11263.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11263.created_at_date: "7 days"]
    unless: [view_11263.id, view_11263.status]
  }

  join: view_11265 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11263.user_id} = ${view_11265.id} ;;
    required_joins: []
  }

  join: view_11266 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11263.account_id} = ${view_11266.account_id} ;;
    required_joins: [view_11265]
  }

  join: view_11267 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11263.category} = ${view_11267.category} ;;
  }

  access_filter: {
    field: view_11263.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11263.is_deleted} = false ;;
}
