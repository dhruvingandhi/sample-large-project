# Explore: explore_1008
# Auto-generated LookML Explore File

include: "/views/domain_25/view_03025.view.lkml"
include: "/views/domain_27/view_03027.view.lkml"
include: "/views/domain_28/view_03028.view.lkml"
include: "/views/domain_29/view_03029.view.lkml"

explore: explore_1008 {
  label: "Explore Explore 1008"
  description: "Comprehensive analytics explore joining base view_03025 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03025
  
  always_filter: {
    filters: [view_03025.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03025.created_at_date: "7 days"]
    unless: [view_03025.id, view_03025.status]
  }

  join: view_03027 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03025.user_id} = ${view_03027.id} ;;
    required_joins: []
  }

  join: view_03028 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03025.account_id} = ${view_03028.account_id} ;;
    required_joins: [view_03027]
  }

  join: view_03029 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03025.category} = ${view_03029.category} ;;
  }

  access_filter: {
    field: view_03025.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03025.is_deleted} = false ;;
}
