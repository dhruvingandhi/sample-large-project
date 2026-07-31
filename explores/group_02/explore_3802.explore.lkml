# Update for 500 file diff target
# Explore: explore_3802
# Auto-generated LookML Explore File

include: "/views/domain_07/view_11407.view.lkml"
include: "/views/domain_09/view_11409.view.lkml"
include: "/views/domain_10/view_11410.view.lkml"
include: "/views/domain_11/view_11411.view.lkml"

explore: explore_3802 {
  label: "Explore Explore 3802"
  description: "Comprehensive analytics explore joining base view_11407 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11407
  
  always_filter: {
    filters: [view_11407.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11407.created_at_date: "7 days"]
    unless: [view_11407.id, view_11407.status]
  }

  join: view_11409 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11407.user_id} = ${view_11409.id} ;;
    required_joins: []
  }

  join: view_11410 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11407.account_id} = ${view_11410.account_id} ;;
    required_joins: [view_11409]
  }

  join: view_11411 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11407.category} = ${view_11411.category} ;;
  }

  access_filter: {
    field: view_11407.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11407.is_deleted} = false ;;
}
