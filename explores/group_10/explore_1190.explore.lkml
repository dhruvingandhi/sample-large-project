# Update for 2000 file diff target
# Explore: explore_1190
# Auto-generated LookML Explore File

include: "/views/domain_21/view_03571.view.lkml"
include: "/views/domain_23/view_03573.view.lkml"
include: "/views/domain_24/view_03574.view.lkml"
include: "/views/domain_25/view_03575.view.lkml"

explore: explore_1190 {
  label: "Explore Explore 1190"
  description: "Comprehensive analytics explore joining base view_03571 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03571
  
  always_filter: {
    filters: [view_03571.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03571.created_at_date: "7 days"]
    unless: [view_03571.id, view_03571.status]
  }

  join: view_03573 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03571.user_id} = ${view_03573.id} ;;
    required_joins: []
  }

  join: view_03574 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03571.account_id} = ${view_03574.account_id} ;;
    required_joins: [view_03573]
  }

  join: view_03575 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03571.category} = ${view_03575.category} ;;
  }

  access_filter: {
    field: view_03571.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03571.is_deleted} = false ;;
}
