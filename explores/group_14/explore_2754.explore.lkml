# Explore: explore_2754
# Auto-generated LookML Explore File

include: "/views/domain_13/view_08263.view.lkml"
include: "/views/domain_15/view_08265.view.lkml"
include: "/views/domain_16/view_08266.view.lkml"
include: "/views/domain_17/view_08267.view.lkml"

explore: explore_2754 {
  label: "Explore Explore 2754"
  description: "Comprehensive analytics explore joining base view_08263 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08263
  
  always_filter: {
    filters: [view_08263.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08263.created_at_date: "7 days"]
    unless: [view_08263.id, view_08263.status]
  }

  join: view_08265 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08263.user_id} = ${view_08265.id} ;;
    required_joins: []
  }

  join: view_08266 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08263.account_id} = ${view_08266.account_id} ;;
    required_joins: [view_08265]
  }

  join: view_08267 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08263.category} = ${view_08267.category} ;;
  }

  access_filter: {
    field: view_08263.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08263.is_deleted} = false ;;
}
