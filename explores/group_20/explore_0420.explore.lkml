# Update for 2000 file diff target
# Explore: explore_0420
# Auto-generated LookML Explore File

include: "/views/domain_11/view_01261.view.lkml"
include: "/views/domain_13/view_01263.view.lkml"
include: "/views/domain_14/view_01264.view.lkml"
include: "/views/domain_15/view_01265.view.lkml"

explore: explore_0420 {
  label: "Explore Explore 0420"
  description: "Comprehensive analytics explore joining base view_01261 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01261
  
  always_filter: {
    filters: [view_01261.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01261.created_at_date: "7 days"]
    unless: [view_01261.id, view_01261.status]
  }

  join: view_01263 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01261.user_id} = ${view_01263.id} ;;
    required_joins: []
  }

  join: view_01264 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01261.account_id} = ${view_01264.account_id} ;;
    required_joins: [view_01263]
  }

  join: view_01265 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01261.category} = ${view_01265.category} ;;
  }

  access_filter: {
    field: view_01261.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01261.is_deleted} = false ;;
}
