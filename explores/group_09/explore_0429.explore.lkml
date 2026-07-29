# Explore: explore_0429
# Auto-generated LookML Explore File

include: "/views/domain_38/view_01288.view.lkml"
include: "/views/domain_40/view_01290.view.lkml"
include: "/views/domain_41/view_01291.view.lkml"
include: "/views/domain_42/view_01292.view.lkml"

explore: explore_0429 {
  label: "Explore Explore 0429"
  description: "Comprehensive analytics explore joining base view_01288 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01288
  
  always_filter: {
    filters: [view_01288.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01288.created_at_date: "7 days"]
    unless: [view_01288.id, view_01288.status]
  }

  join: view_01290 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01288.user_id} = ${view_01290.id} ;;
    required_joins: []
  }

  join: view_01291 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01288.account_id} = ${view_01291.account_id} ;;
    required_joins: [view_01290]
  }

  join: view_01292 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01288.category} = ${view_01292.category} ;;
  }

  access_filter: {
    field: view_01288.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01288.is_deleted} = false ;;
}
