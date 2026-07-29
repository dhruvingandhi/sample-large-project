# Explore: explore_0093
# Auto-generated LookML Explore File

include: "/views/domain_30/view_00280.view.lkml"
include: "/views/domain_32/view_00282.view.lkml"
include: "/views/domain_33/view_00283.view.lkml"
include: "/views/domain_34/view_00284.view.lkml"

explore: explore_0093 {
  label: "Explore Explore 0093"
  description: "Comprehensive analytics explore joining base view_00280 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00280
  
  always_filter: {
    filters: [view_00280.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00280.created_at_date: "7 days"]
    unless: [view_00280.id, view_00280.status]
  }

  join: view_00282 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00280.user_id} = ${view_00282.id} ;;
    required_joins: []
  }

  join: view_00283 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00280.account_id} = ${view_00283.account_id} ;;
    required_joins: [view_00282]
  }

  join: view_00284 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00280.category} = ${view_00284.category} ;;
  }

  access_filter: {
    field: view_00280.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00280.is_deleted} = false ;;
}
