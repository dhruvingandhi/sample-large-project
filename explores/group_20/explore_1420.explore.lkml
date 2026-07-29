# Explore: explore_1420
# Auto-generated LookML Explore File

include: "/views/domain_11/view_04261.view.lkml"
include: "/views/domain_13/view_04263.view.lkml"
include: "/views/domain_14/view_04264.view.lkml"
include: "/views/domain_15/view_04265.view.lkml"

explore: explore_1420 {
  label: "Explore Explore 1420"
  description: "Comprehensive analytics explore joining base view_04261 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04261
  
  always_filter: {
    filters: [view_04261.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04261.created_at_date: "7 days"]
    unless: [view_04261.id, view_04261.status]
  }

  join: view_04263 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04261.user_id} = ${view_04263.id} ;;
    required_joins: []
  }

  join: view_04264 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04261.account_id} = ${view_04264.account_id} ;;
    required_joins: [view_04263]
  }

  join: view_04265 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04261.category} = ${view_04265.category} ;;
  }

  access_filter: {
    field: view_04261.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04261.is_deleted} = false ;;
}
