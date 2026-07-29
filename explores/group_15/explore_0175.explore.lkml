# Explore: explore_0175
# Auto-generated LookML Explore File

include: "/views/domain_26/view_00526.view.lkml"
include: "/views/domain_28/view_00528.view.lkml"
include: "/views/domain_29/view_00529.view.lkml"
include: "/views/domain_30/view_00530.view.lkml"

explore: explore_0175 {
  label: "Explore Explore 0175"
  description: "Comprehensive analytics explore joining base view_00526 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00526
  
  always_filter: {
    filters: [view_00526.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00526.created_at_date: "7 days"]
    unless: [view_00526.id, view_00526.status]
  }

  join: view_00528 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00526.user_id} = ${view_00528.id} ;;
    required_joins: []
  }

  join: view_00529 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00526.account_id} = ${view_00529.account_id} ;;
    required_joins: [view_00528]
  }

  join: view_00530 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00526.category} = ${view_00530.category} ;;
  }

  access_filter: {
    field: view_00526.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00526.is_deleted} = false ;;
}
