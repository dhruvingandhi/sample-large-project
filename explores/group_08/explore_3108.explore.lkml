# Explore: explore_3108
# Auto-generated LookML Explore File

include: "/views/domain_25/view_09325.view.lkml"
include: "/views/domain_27/view_09327.view.lkml"
include: "/views/domain_28/view_09328.view.lkml"
include: "/views/domain_29/view_09329.view.lkml"

explore: explore_3108 {
  label: "Explore Explore 3108"
  description: "Comprehensive analytics explore joining base view_09325 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09325
  
  always_filter: {
    filters: [view_09325.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09325.created_at_date: "7 days"]
    unless: [view_09325.id, view_09325.status]
  }

  join: view_09327 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09325.user_id} = ${view_09327.id} ;;
    required_joins: []
  }

  join: view_09328 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09325.account_id} = ${view_09328.account_id} ;;
    required_joins: [view_09327]
  }

  join: view_09329 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09325.category} = ${view_09329.category} ;;
  }

  access_filter: {
    field: view_09325.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09325.is_deleted} = false ;;
}
