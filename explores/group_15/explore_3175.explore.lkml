# Explore: explore_3175
# Auto-generated LookML Explore File

include: "/views/domain_26/view_09526.view.lkml"
include: "/views/domain_28/view_09528.view.lkml"
include: "/views/domain_29/view_09529.view.lkml"
include: "/views/domain_30/view_09530.view.lkml"

explore: explore_3175 {
  label: "Explore Explore 3175"
  description: "Comprehensive analytics explore joining base view_09526 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09526
  
  always_filter: {
    filters: [view_09526.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09526.created_at_date: "7 days"]
    unless: [view_09526.id, view_09526.status]
  }

  join: view_09528 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09526.user_id} = ${view_09528.id} ;;
    required_joins: []
  }

  join: view_09529 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09526.account_id} = ${view_09529.account_id} ;;
    required_joins: [view_09528]
  }

  join: view_09530 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09526.category} = ${view_09530.category} ;;
  }

  access_filter: {
    field: view_09526.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09526.is_deleted} = false ;;
}
