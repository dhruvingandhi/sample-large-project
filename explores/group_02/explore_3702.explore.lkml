# Explore: explore_3702
# Auto-generated LookML Explore File

include: "/views/domain_07/view_11107.view.lkml"
include: "/views/domain_09/view_11109.view.lkml"
include: "/views/domain_10/view_11110.view.lkml"
include: "/views/domain_11/view_11111.view.lkml"

explore: explore_3702 {
  label: "Explore Explore 3702"
  description: "Comprehensive analytics explore joining base view_11107 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11107
  
  always_filter: {
    filters: [view_11107.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11107.created_at_date: "7 days"]
    unless: [view_11107.id, view_11107.status]
  }

  join: view_11109 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11107.user_id} = ${view_11109.id} ;;
    required_joins: []
  }

  join: view_11110 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11107.account_id} = ${view_11110.account_id} ;;
    required_joins: [view_11109]
  }

  join: view_11111 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11107.category} = ${view_11111.category} ;;
  }

  access_filter: {
    field: view_11107.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11107.is_deleted} = false ;;
}
