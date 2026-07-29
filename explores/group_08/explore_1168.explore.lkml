# Explore: explore_1168
# Auto-generated LookML Explore File

include: "/views/domain_05/view_03505.view.lkml"
include: "/views/domain_07/view_03507.view.lkml"
include: "/views/domain_08/view_03508.view.lkml"
include: "/views/domain_09/view_03509.view.lkml"

explore: explore_1168 {
  label: "Explore Explore 1168"
  description: "Comprehensive analytics explore joining base view_03505 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03505
  
  always_filter: {
    filters: [view_03505.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03505.created_at_date: "7 days"]
    unless: [view_03505.id, view_03505.status]
  }

  join: view_03507 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03505.user_id} = ${view_03507.id} ;;
    required_joins: []
  }

  join: view_03508 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03505.account_id} = ${view_03508.account_id} ;;
    required_joins: [view_03507]
  }

  join: view_03509 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03505.category} = ${view_03509.category} ;;
  }

  access_filter: {
    field: view_03505.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03505.is_deleted} = false ;;
}
