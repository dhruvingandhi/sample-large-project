# Explore: explore_0121
# Auto-generated LookML Explore File

include: "/views/domain_14/view_00364.view.lkml"
include: "/views/domain_16/view_00366.view.lkml"
include: "/views/domain_17/view_00367.view.lkml"
include: "/views/domain_18/view_00368.view.lkml"

explore: explore_0121 {
  label: "Explore Explore 0121"
  description: "Comprehensive analytics explore joining base view_00364 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00364
  
  always_filter: {
    filters: [view_00364.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00364.created_at_date: "7 days"]
    unless: [view_00364.id, view_00364.status]
  }

  join: view_00366 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00364.user_id} = ${view_00366.id} ;;
    required_joins: []
  }

  join: view_00367 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00364.account_id} = ${view_00367.account_id} ;;
    required_joins: [view_00366]
  }

  join: view_00368 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00364.category} = ${view_00368.category} ;;
  }

  access_filter: {
    field: view_00364.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00364.is_deleted} = false ;;
}
