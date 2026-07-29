# Explore: explore_0452
# Auto-generated LookML Explore File

include: "/views/domain_07/view_01357.view.lkml"
include: "/views/domain_09/view_01359.view.lkml"
include: "/views/domain_10/view_01360.view.lkml"
include: "/views/domain_11/view_01361.view.lkml"

explore: explore_0452 {
  label: "Explore Explore 0452"
  description: "Comprehensive analytics explore joining base view_01357 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01357
  
  always_filter: {
    filters: [view_01357.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01357.created_at_date: "7 days"]
    unless: [view_01357.id, view_01357.status]
  }

  join: view_01359 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01357.user_id} = ${view_01359.id} ;;
    required_joins: []
  }

  join: view_01360 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01357.account_id} = ${view_01360.account_id} ;;
    required_joins: [view_01359]
  }

  join: view_01361 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01357.category} = ${view_01361.category} ;;
  }

  access_filter: {
    field: view_01357.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01357.is_deleted} = false ;;
}
