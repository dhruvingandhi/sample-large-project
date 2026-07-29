# Explore: explore_2786
# Auto-generated LookML Explore File

include: "/views/domain_09/view_08359.view.lkml"
include: "/views/domain_11/view_08361.view.lkml"
include: "/views/domain_12/view_08362.view.lkml"
include: "/views/domain_13/view_08363.view.lkml"

explore: explore_2786 {
  label: "Explore Explore 2786"
  description: "Comprehensive analytics explore joining base view_08359 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08359
  
  always_filter: {
    filters: [view_08359.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08359.created_at_date: "7 days"]
    unless: [view_08359.id, view_08359.status]
  }

  join: view_08361 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08359.user_id} = ${view_08361.id} ;;
    required_joins: []
  }

  join: view_08362 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08359.account_id} = ${view_08362.account_id} ;;
    required_joins: [view_08361]
  }

  join: view_08363 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08359.category} = ${view_08363.category} ;;
  }

  access_filter: {
    field: view_08359.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08359.is_deleted} = false ;;
}
