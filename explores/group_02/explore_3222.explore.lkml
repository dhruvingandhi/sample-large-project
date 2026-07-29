# Explore: explore_3222
# Auto-generated LookML Explore File

include: "/views/domain_17/view_09667.view.lkml"
include: "/views/domain_19/view_09669.view.lkml"
include: "/views/domain_20/view_09670.view.lkml"
include: "/views/domain_21/view_09671.view.lkml"

explore: explore_3222 {
  label: "Explore Explore 3222"
  description: "Comprehensive analytics explore joining base view_09667 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09667
  
  always_filter: {
    filters: [view_09667.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09667.created_at_date: "7 days"]
    unless: [view_09667.id, view_09667.status]
  }

  join: view_09669 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09667.user_id} = ${view_09669.id} ;;
    required_joins: []
  }

  join: view_09670 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09667.account_id} = ${view_09670.account_id} ;;
    required_joins: [view_09669]
  }

  join: view_09671 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09667.category} = ${view_09671.category} ;;
  }

  access_filter: {
    field: view_09667.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09667.is_deleted} = false ;;
}
