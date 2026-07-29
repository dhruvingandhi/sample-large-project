# Explore: explore_0379
# Auto-generated LookML Explore File

include: "/views/domain_38/view_01138.view.lkml"
include: "/views/domain_40/view_01140.view.lkml"
include: "/views/domain_41/view_01141.view.lkml"
include: "/views/domain_42/view_01142.view.lkml"

explore: explore_0379 {
  label: "Explore Explore 0379"
  description: "Comprehensive analytics explore joining base view_01138 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01138
  
  always_filter: {
    filters: [view_01138.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01138.created_at_date: "7 days"]
    unless: [view_01138.id, view_01138.status]
  }

  join: view_01140 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01138.user_id} = ${view_01140.id} ;;
    required_joins: []
  }

  join: view_01141 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01138.account_id} = ${view_01141.account_id} ;;
    required_joins: [view_01140]
  }

  join: view_01142 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01138.category} = ${view_01142.category} ;;
  }

  access_filter: {
    field: view_01138.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01138.is_deleted} = false ;;
}
