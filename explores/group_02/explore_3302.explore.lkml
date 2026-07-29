# Explore: explore_3302
# Auto-generated LookML Explore File

include: "/views/domain_07/view_09907.view.lkml"
include: "/views/domain_09/view_09909.view.lkml"
include: "/views/domain_10/view_09910.view.lkml"
include: "/views/domain_11/view_09911.view.lkml"

explore: explore_3302 {
  label: "Explore Explore 3302"
  description: "Comprehensive analytics explore joining base view_09907 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09907
  
  always_filter: {
    filters: [view_09907.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09907.created_at_date: "7 days"]
    unless: [view_09907.id, view_09907.status]
  }

  join: view_09909 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09907.user_id} = ${view_09909.id} ;;
    required_joins: []
  }

  join: view_09910 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09907.account_id} = ${view_09910.account_id} ;;
    required_joins: [view_09909]
  }

  join: view_09911 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09907.category} = ${view_09911.category} ;;
  }

  access_filter: {
    field: view_09907.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09907.is_deleted} = false ;;
}
