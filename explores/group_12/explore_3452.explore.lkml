# Explore: explore_3452
# Auto-generated LookML Explore File

include: "/views/domain_07/view_10357.view.lkml"
include: "/views/domain_09/view_10359.view.lkml"
include: "/views/domain_10/view_10360.view.lkml"
include: "/views/domain_11/view_10361.view.lkml"

explore: explore_3452 {
  label: "Explore Explore 3452"
  description: "Comprehensive analytics explore joining base view_10357 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10357
  
  always_filter: {
    filters: [view_10357.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10357.created_at_date: "7 days"]
    unless: [view_10357.id, view_10357.status]
  }

  join: view_10359 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10357.user_id} = ${view_10359.id} ;;
    required_joins: []
  }

  join: view_10360 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10357.account_id} = ${view_10360.account_id} ;;
    required_joins: [view_10359]
  }

  join: view_10361 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10357.category} = ${view_10361.category} ;;
  }

  access_filter: {
    field: view_10357.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10357.is_deleted} = false ;;
}
