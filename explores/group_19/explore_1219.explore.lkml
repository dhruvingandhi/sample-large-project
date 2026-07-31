# Update for 2000 file diff target
# Explore: explore_1219
# Auto-generated LookML Explore File

include: "/views/domain_08/view_03658.view.lkml"
include: "/views/domain_10/view_03660.view.lkml"
include: "/views/domain_11/view_03661.view.lkml"
include: "/views/domain_12/view_03662.view.lkml"

explore: explore_1219 {
  label: "Explore Explore 1219"
  description: "Comprehensive analytics explore joining base view_03658 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03658
  
  always_filter: {
    filters: [view_03658.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03658.created_at_date: "7 days"]
    unless: [view_03658.id, view_03658.status]
  }

  join: view_03660 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03658.user_id} = ${view_03660.id} ;;
    required_joins: []
  }

  join: view_03661 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03658.account_id} = ${view_03661.account_id} ;;
    required_joins: [view_03660]
  }

  join: view_03662 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03658.category} = ${view_03662.category} ;;
  }

  access_filter: {
    field: view_03658.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03658.is_deleted} = false ;;
}
