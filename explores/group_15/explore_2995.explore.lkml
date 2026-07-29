# Explore: explore_2995
# Auto-generated LookML Explore File

include: "/views/domain_36/view_08986.view.lkml"
include: "/views/domain_38/view_08988.view.lkml"
include: "/views/domain_39/view_08989.view.lkml"
include: "/views/domain_40/view_08990.view.lkml"

explore: explore_2995 {
  label: "Explore Explore 2995"
  description: "Comprehensive analytics explore joining base view_08986 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08986
  
  always_filter: {
    filters: [view_08986.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08986.created_at_date: "7 days"]
    unless: [view_08986.id, view_08986.status]
  }

  join: view_08988 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08986.user_id} = ${view_08988.id} ;;
    required_joins: []
  }

  join: view_08989 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08986.account_id} = ${view_08989.account_id} ;;
    required_joins: [view_08988]
  }

  join: view_08990 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08986.category} = ${view_08990.category} ;;
  }

  access_filter: {
    field: view_08986.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08986.is_deleted} = false ;;
}
