# Explore: explore_2633
# Auto-generated LookML Explore File

include: "/views/domain_50/view_07900.view.lkml"
include: "/views/domain_02/view_07902.view.lkml"
include: "/views/domain_03/view_07903.view.lkml"
include: "/views/domain_04/view_07904.view.lkml"

explore: explore_2633 {
  label: "Explore Explore 2633"
  description: "Comprehensive analytics explore joining base view_07900 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07900
  
  always_filter: {
    filters: [view_07900.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07900.created_at_date: "7 days"]
    unless: [view_07900.id, view_07900.status]
  }

  join: view_07902 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07900.user_id} = ${view_07902.id} ;;
    required_joins: []
  }

  join: view_07903 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07900.account_id} = ${view_07903.account_id} ;;
    required_joins: [view_07902]
  }

  join: view_07904 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07900.category} = ${view_07904.category} ;;
  }

  access_filter: {
    field: view_07900.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07900.is_deleted} = false ;;
}
