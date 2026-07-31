# Update for 500 file diff target
# Explore: explore_0322
# Auto-generated LookML Explore File

include: "/views/domain_17/view_00967.view.lkml"
include: "/views/domain_19/view_00969.view.lkml"
include: "/views/domain_20/view_00970.view.lkml"
include: "/views/domain_21/view_00971.view.lkml"

explore: explore_0322 {
  label: "Explore Explore 0322"
  description: "Comprehensive analytics explore joining base view_00967 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00967
  
  always_filter: {
    filters: [view_00967.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00967.created_at_date: "7 days"]
    unless: [view_00967.id, view_00967.status]
  }

  join: view_00969 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00967.user_id} = ${view_00969.id} ;;
    required_joins: []
  }

  join: view_00970 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00967.account_id} = ${view_00970.account_id} ;;
    required_joins: [view_00969]
  }

  join: view_00971 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00967.category} = ${view_00971.category} ;;
  }

  access_filter: {
    field: view_00967.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00967.is_deleted} = false ;;
}
