# Explore: explore_3865
# Auto-generated LookML Explore File

include: "/views/domain_46/view_11596.view.lkml"
include: "/views/domain_48/view_11598.view.lkml"
include: "/views/domain_49/view_11599.view.lkml"
include: "/views/domain_50/view_11600.view.lkml"

explore: explore_3865 {
  label: "Explore Explore 3865"
  description: "Comprehensive analytics explore joining base view_11596 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11596
  
  always_filter: {
    filters: [view_11596.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11596.created_at_date: "7 days"]
    unless: [view_11596.id, view_11596.status]
  }

  join: view_11598 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11596.user_id} = ${view_11598.id} ;;
    required_joins: []
  }

  join: view_11599 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11596.account_id} = ${view_11599.account_id} ;;
    required_joins: [view_11598]
  }

  join: view_11600 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11596.category} = ${view_11600.category} ;;
  }

  access_filter: {
    field: view_11596.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11596.is_deleted} = false ;;
}
