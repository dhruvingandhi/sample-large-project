# Explore: explore_3904
# Auto-generated LookML Explore File

include: "/views/domain_13/view_11713.view.lkml"
include: "/views/domain_15/view_11715.view.lkml"
include: "/views/domain_16/view_11716.view.lkml"
include: "/views/domain_17/view_11717.view.lkml"

explore: explore_3904 {
  label: "Explore Explore 3904"
  description: "Comprehensive analytics explore joining base view_11713 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11713
  
  always_filter: {
    filters: [view_11713.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11713.created_at_date: "7 days"]
    unless: [view_11713.id, view_11713.status]
  }

  join: view_11715 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11713.user_id} = ${view_11715.id} ;;
    required_joins: []
  }

  join: view_11716 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11713.account_id} = ${view_11716.account_id} ;;
    required_joins: [view_11715]
  }

  join: view_11717 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11713.category} = ${view_11717.category} ;;
  }

  access_filter: {
    field: view_11713.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11713.is_deleted} = false ;;
}
