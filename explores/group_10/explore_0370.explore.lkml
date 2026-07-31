# Update for 2000 file diff target
# Explore: explore_0370
# Auto-generated LookML Explore File

include: "/views/domain_11/view_01111.view.lkml"
include: "/views/domain_13/view_01113.view.lkml"
include: "/views/domain_14/view_01114.view.lkml"
include: "/views/domain_15/view_01115.view.lkml"

explore: explore_0370 {
  label: "Explore Explore 0370"
  description: "Comprehensive analytics explore joining base view_01111 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01111
  
  always_filter: {
    filters: [view_01111.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01111.created_at_date: "7 days"]
    unless: [view_01111.id, view_01111.status]
  }

  join: view_01113 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01111.user_id} = ${view_01113.id} ;;
    required_joins: []
  }

  join: view_01114 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01111.account_id} = ${view_01114.account_id} ;;
    required_joins: [view_01113]
  }

  join: view_01115 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01111.category} = ${view_01115.category} ;;
  }

  access_filter: {
    field: view_01111.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01111.is_deleted} = false ;;
}
