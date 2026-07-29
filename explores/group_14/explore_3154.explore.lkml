# Explore: explore_3154
# Auto-generated LookML Explore File

include: "/views/domain_13/view_09463.view.lkml"
include: "/views/domain_15/view_09465.view.lkml"
include: "/views/domain_16/view_09466.view.lkml"
include: "/views/domain_17/view_09467.view.lkml"

explore: explore_3154 {
  label: "Explore Explore 3154"
  description: "Comprehensive analytics explore joining base view_09463 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09463
  
  always_filter: {
    filters: [view_09463.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09463.created_at_date: "7 days"]
    unless: [view_09463.id, view_09463.status]
  }

  join: view_09465 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09463.user_id} = ${view_09465.id} ;;
    required_joins: []
  }

  join: view_09466 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09463.account_id} = ${view_09466.account_id} ;;
    required_joins: [view_09465]
  }

  join: view_09467 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09463.category} = ${view_09467.category} ;;
  }

  access_filter: {
    field: view_09463.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09463.is_deleted} = false ;;
}
