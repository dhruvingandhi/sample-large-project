# Explore: explore_1702
# Auto-generated LookML Explore File

include: "/views/domain_07/view_05107.view.lkml"
include: "/views/domain_09/view_05109.view.lkml"
include: "/views/domain_10/view_05110.view.lkml"
include: "/views/domain_11/view_05111.view.lkml"

explore: explore_1702 {
  label: "Explore Explore 1702"
  description: "Comprehensive analytics explore joining base view_05107 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05107
  
  always_filter: {
    filters: [view_05107.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05107.created_at_date: "7 days"]
    unless: [view_05107.id, view_05107.status]
  }

  join: view_05109 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05107.user_id} = ${view_05109.id} ;;
    required_joins: []
  }

  join: view_05110 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05107.account_id} = ${view_05110.account_id} ;;
    required_joins: [view_05109]
  }

  join: view_05111 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05107.category} = ${view_05111.category} ;;
  }

  access_filter: {
    field: view_05107.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05107.is_deleted} = false ;;
}
