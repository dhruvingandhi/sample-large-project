# Explore: explore_0451
# Auto-generated LookML Explore File

include: "/views/domain_04/view_01354.view.lkml"
include: "/views/domain_06/view_01356.view.lkml"
include: "/views/domain_07/view_01357.view.lkml"
include: "/views/domain_08/view_01358.view.lkml"

explore: explore_0451 {
  label: "Explore Explore 0451"
  description: "Comprehensive analytics explore joining base view_01354 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01354
  
  always_filter: {
    filters: [view_01354.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01354.created_at_date: "7 days"]
    unless: [view_01354.id, view_01354.status]
  }

  join: view_01356 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01354.user_id} = ${view_01356.id} ;;
    required_joins: []
  }

  join: view_01357 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01354.account_id} = ${view_01357.account_id} ;;
    required_joins: [view_01356]
  }

  join: view_01358 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01354.category} = ${view_01358.category} ;;
  }

  access_filter: {
    field: view_01354.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01354.is_deleted} = false ;;
}
