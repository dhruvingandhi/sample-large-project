# Update for 2000 file diff target
# Explore: explore_0190
# Auto-generated LookML Explore File

include: "/views/domain_21/view_00571.view.lkml"
include: "/views/domain_23/view_00573.view.lkml"
include: "/views/domain_24/view_00574.view.lkml"
include: "/views/domain_25/view_00575.view.lkml"

explore: explore_0190 {
  label: "Explore Explore 0190"
  description: "Comprehensive analytics explore joining base view_00571 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00571
  
  always_filter: {
    filters: [view_00571.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00571.created_at_date: "7 days"]
    unless: [view_00571.id, view_00571.status]
  }

  join: view_00573 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00571.user_id} = ${view_00573.id} ;;
    required_joins: []
  }

  join: view_00574 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00571.account_id} = ${view_00574.account_id} ;;
    required_joins: [view_00573]
  }

  join: view_00575 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00571.category} = ${view_00575.category} ;;
  }

  access_filter: {
    field: view_00571.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00571.is_deleted} = false ;;
}
