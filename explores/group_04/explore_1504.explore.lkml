# Explore: explore_1504
# Auto-generated LookML Explore File

include: "/views/domain_13/view_04513.view.lkml"
include: "/views/domain_15/view_04515.view.lkml"
include: "/views/domain_16/view_04516.view.lkml"
include: "/views/domain_17/view_04517.view.lkml"

explore: explore_1504 {
  label: "Explore Explore 1504"
  description: "Comprehensive analytics explore joining base view_04513 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04513
  
  always_filter: {
    filters: [view_04513.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04513.created_at_date: "7 days"]
    unless: [view_04513.id, view_04513.status]
  }

  join: view_04515 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04513.user_id} = ${view_04515.id} ;;
    required_joins: []
  }

  join: view_04516 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04513.account_id} = ${view_04516.account_id} ;;
    required_joins: [view_04515]
  }

  join: view_04517 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04513.category} = ${view_04517.category} ;;
  }

  access_filter: {
    field: view_04513.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04513.is_deleted} = false ;;
}
