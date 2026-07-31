# Update for 500 file diff target
# Explore: explore_1302
# Auto-generated LookML Explore File

include: "/views/domain_07/view_03907.view.lkml"
include: "/views/domain_09/view_03909.view.lkml"
include: "/views/domain_10/view_03910.view.lkml"
include: "/views/domain_11/view_03911.view.lkml"

explore: explore_1302 {
  label: "Explore Explore 1302"
  description: "Comprehensive analytics explore joining base view_03907 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03907
  
  always_filter: {
    filters: [view_03907.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03907.created_at_date: "7 days"]
    unless: [view_03907.id, view_03907.status]
  }

  join: view_03909 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03907.user_id} = ${view_03909.id} ;;
    required_joins: []
  }

  join: view_03910 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03907.account_id} = ${view_03910.account_id} ;;
    required_joins: [view_03909]
  }

  join: view_03911 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03907.category} = ${view_03911.category} ;;
  }

  access_filter: {
    field: view_03907.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03907.is_deleted} = false ;;
}
