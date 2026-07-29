# Explore: explore_2153
# Auto-generated LookML Explore File

include: "/views/domain_10/view_06460.view.lkml"
include: "/views/domain_12/view_06462.view.lkml"
include: "/views/domain_13/view_06463.view.lkml"
include: "/views/domain_14/view_06464.view.lkml"

explore: explore_2153 {
  label: "Explore Explore 2153"
  description: "Comprehensive analytics explore joining base view_06460 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06460
  
  always_filter: {
    filters: [view_06460.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06460.created_at_date: "7 days"]
    unless: [view_06460.id, view_06460.status]
  }

  join: view_06462 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06460.user_id} = ${view_06462.id} ;;
    required_joins: []
  }

  join: view_06463 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06460.account_id} = ${view_06463.account_id} ;;
    required_joins: [view_06462]
  }

  join: view_06464 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06460.category} = ${view_06464.category} ;;
  }

  access_filter: {
    field: view_06460.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06460.is_deleted} = false ;;
}
