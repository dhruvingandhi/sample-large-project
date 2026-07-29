# Explore: explore_3261
# Auto-generated LookML Explore File

include: "/views/domain_34/view_09784.view.lkml"
include: "/views/domain_36/view_09786.view.lkml"
include: "/views/domain_37/view_09787.view.lkml"
include: "/views/domain_38/view_09788.view.lkml"

explore: explore_3261 {
  label: "Explore Explore 3261"
  description: "Comprehensive analytics explore joining base view_09784 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09784
  
  always_filter: {
    filters: [view_09784.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09784.created_at_date: "7 days"]
    unless: [view_09784.id, view_09784.status]
  }

  join: view_09786 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09784.user_id} = ${view_09786.id} ;;
    required_joins: []
  }

  join: view_09787 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09784.account_id} = ${view_09787.account_id} ;;
    required_joins: [view_09786]
  }

  join: view_09788 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09784.category} = ${view_09788.category} ;;
  }

  access_filter: {
    field: view_09784.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09784.is_deleted} = false ;;
}
