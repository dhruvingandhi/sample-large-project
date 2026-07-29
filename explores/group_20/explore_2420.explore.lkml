# Explore: explore_2420
# Auto-generated LookML Explore File

include: "/views/domain_11/view_07261.view.lkml"
include: "/views/domain_13/view_07263.view.lkml"
include: "/views/domain_14/view_07264.view.lkml"
include: "/views/domain_15/view_07265.view.lkml"

explore: explore_2420 {
  label: "Explore Explore 2420"
  description: "Comprehensive analytics explore joining base view_07261 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07261
  
  always_filter: {
    filters: [view_07261.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07261.created_at_date: "7 days"]
    unless: [view_07261.id, view_07261.status]
  }

  join: view_07263 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07261.user_id} = ${view_07263.id} ;;
    required_joins: []
  }

  join: view_07264 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07261.account_id} = ${view_07264.account_id} ;;
    required_joins: [view_07263]
  }

  join: view_07265 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07261.category} = ${view_07265.category} ;;
  }

  access_filter: {
    field: view_07261.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07261.is_deleted} = false ;;
}
