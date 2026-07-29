# Explore: explore_2452
# Auto-generated LookML Explore File

include: "/views/domain_07/view_07357.view.lkml"
include: "/views/domain_09/view_07359.view.lkml"
include: "/views/domain_10/view_07360.view.lkml"
include: "/views/domain_11/view_07361.view.lkml"

explore: explore_2452 {
  label: "Explore Explore 2452"
  description: "Comprehensive analytics explore joining base view_07357 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07357
  
  always_filter: {
    filters: [view_07357.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07357.created_at_date: "7 days"]
    unless: [view_07357.id, view_07357.status]
  }

  join: view_07359 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07357.user_id} = ${view_07359.id} ;;
    required_joins: []
  }

  join: view_07360 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07357.account_id} = ${view_07360.account_id} ;;
    required_joins: [view_07359]
  }

  join: view_07361 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07357.category} = ${view_07361.category} ;;
  }

  access_filter: {
    field: view_07357.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07357.is_deleted} = false ;;
}
