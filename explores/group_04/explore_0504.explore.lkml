# Explore: explore_0504
# Auto-generated LookML Explore File

include: "/views/domain_13/view_01513.view.lkml"
include: "/views/domain_15/view_01515.view.lkml"
include: "/views/domain_16/view_01516.view.lkml"
include: "/views/domain_17/view_01517.view.lkml"

explore: explore_0504 {
  label: "Explore Explore 0504"
  description: "Comprehensive analytics explore joining base view_01513 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01513
  
  always_filter: {
    filters: [view_01513.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01513.created_at_date: "7 days"]
    unless: [view_01513.id, view_01513.status]
  }

  join: view_01515 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01513.user_id} = ${view_01515.id} ;;
    required_joins: []
  }

  join: view_01516 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01513.account_id} = ${view_01516.account_id} ;;
    required_joins: [view_01515]
  }

  join: view_01517 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01513.category} = ${view_01517.category} ;;
  }

  access_filter: {
    field: view_01513.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01513.is_deleted} = false ;;
}
