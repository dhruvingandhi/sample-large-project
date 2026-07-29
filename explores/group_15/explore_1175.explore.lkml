# Explore: explore_1175
# Auto-generated LookML Explore File

include: "/views/domain_26/view_03526.view.lkml"
include: "/views/domain_28/view_03528.view.lkml"
include: "/views/domain_29/view_03529.view.lkml"
include: "/views/domain_30/view_03530.view.lkml"

explore: explore_1175 {
  label: "Explore Explore 1175"
  description: "Comprehensive analytics explore joining base view_03526 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03526
  
  always_filter: {
    filters: [view_03526.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03526.created_at_date: "7 days"]
    unless: [view_03526.id, view_03526.status]
  }

  join: view_03528 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03526.user_id} = ${view_03528.id} ;;
    required_joins: []
  }

  join: view_03529 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03526.account_id} = ${view_03529.account_id} ;;
    required_joins: [view_03528]
  }

  join: view_03530 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03526.category} = ${view_03530.category} ;;
  }

  access_filter: {
    field: view_03526.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03526.is_deleted} = false ;;
}
