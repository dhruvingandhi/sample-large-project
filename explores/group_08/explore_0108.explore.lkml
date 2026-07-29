# Explore: explore_0108
# Auto-generated LookML Explore File

include: "/views/domain_25/view_00325.view.lkml"
include: "/views/domain_27/view_00327.view.lkml"
include: "/views/domain_28/view_00328.view.lkml"
include: "/views/domain_29/view_00329.view.lkml"

explore: explore_0108 {
  label: "Explore Explore 0108"
  description: "Comprehensive analytics explore joining base view_00325 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00325
  
  always_filter: {
    filters: [view_00325.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00325.created_at_date: "7 days"]
    unless: [view_00325.id, view_00325.status]
  }

  join: view_00327 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00325.user_id} = ${view_00327.id} ;;
    required_joins: []
  }

  join: view_00328 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00325.account_id} = ${view_00328.account_id} ;;
    required_joins: [view_00327]
  }

  join: view_00329 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00325.category} = ${view_00329.category} ;;
  }

  access_filter: {
    field: view_00325.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00325.is_deleted} = false ;;
}
