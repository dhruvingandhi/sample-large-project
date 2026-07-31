# Update for 2000 file diff target
# Explore: explore_3530
# Auto-generated LookML Explore File

include: "/views/domain_41/view_10591.view.lkml"
include: "/views/domain_43/view_10593.view.lkml"
include: "/views/domain_44/view_10594.view.lkml"
include: "/views/domain_45/view_10595.view.lkml"

explore: explore_3530 {
  label: "Explore Explore 3530"
  description: "Comprehensive analytics explore joining base view_10591 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10591
  
  always_filter: {
    filters: [view_10591.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10591.created_at_date: "7 days"]
    unless: [view_10591.id, view_10591.status]
  }

  join: view_10593 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10591.user_id} = ${view_10593.id} ;;
    required_joins: []
  }

  join: view_10594 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10591.account_id} = ${view_10594.account_id} ;;
    required_joins: [view_10593]
  }

  join: view_10595 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10591.category} = ${view_10595.category} ;;
  }

  access_filter: {
    field: view_10591.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10591.is_deleted} = false ;;
}
