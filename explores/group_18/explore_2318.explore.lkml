# Explore: explore_2318
# Auto-generated LookML Explore File

include: "/views/domain_05/view_06955.view.lkml"
include: "/views/domain_07/view_06957.view.lkml"
include: "/views/domain_08/view_06958.view.lkml"
include: "/views/domain_09/view_06959.view.lkml"

explore: explore_2318 {
  label: "Explore Explore 2318"
  description: "Comprehensive analytics explore joining base view_06955 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06955
  
  always_filter: {
    filters: [view_06955.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06955.created_at_date: "7 days"]
    unless: [view_06955.id, view_06955.status]
  }

  join: view_06957 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06955.user_id} = ${view_06957.id} ;;
    required_joins: []
  }

  join: view_06958 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06955.account_id} = ${view_06958.account_id} ;;
    required_joins: [view_06957]
  }

  join: view_06959 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06955.category} = ${view_06959.category} ;;
  }

  access_filter: {
    field: view_06955.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06955.is_deleted} = false ;;
}
