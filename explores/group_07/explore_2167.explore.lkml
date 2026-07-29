# Explore: explore_2167
# Auto-generated LookML Explore File

include: "/views/domain_02/view_06502.view.lkml"
include: "/views/domain_04/view_06504.view.lkml"
include: "/views/domain_05/view_06505.view.lkml"
include: "/views/domain_06/view_06506.view.lkml"

explore: explore_2167 {
  label: "Explore Explore 2167"
  description: "Comprehensive analytics explore joining base view_06502 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06502
  
  always_filter: {
    filters: [view_06502.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06502.created_at_date: "7 days"]
    unless: [view_06502.id, view_06502.status]
  }

  join: view_06504 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06502.user_id} = ${view_06504.id} ;;
    required_joins: []
  }

  join: view_06505 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06502.account_id} = ${view_06505.account_id} ;;
    required_joins: [view_06504]
  }

  join: view_06506 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06502.category} = ${view_06506.category} ;;
  }

  access_filter: {
    field: view_06502.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06502.is_deleted} = false ;;
}
