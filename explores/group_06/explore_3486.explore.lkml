# Explore: explore_3486
# Auto-generated LookML Explore File

include: "/views/domain_09/view_10459.view.lkml"
include: "/views/domain_11/view_10461.view.lkml"
include: "/views/domain_12/view_10462.view.lkml"
include: "/views/domain_13/view_10463.view.lkml"

explore: explore_3486 {
  label: "Explore Explore 3486"
  description: "Comprehensive analytics explore joining base view_10459 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10459
  
  always_filter: {
    filters: [view_10459.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10459.created_at_date: "7 days"]
    unless: [view_10459.id, view_10459.status]
  }

  join: view_10461 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10459.user_id} = ${view_10461.id} ;;
    required_joins: []
  }

  join: view_10462 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10459.account_id} = ${view_10462.account_id} ;;
    required_joins: [view_10461]
  }

  join: view_10463 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10459.category} = ${view_10463.category} ;;
  }

  access_filter: {
    field: view_10459.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10459.is_deleted} = false ;;
}
