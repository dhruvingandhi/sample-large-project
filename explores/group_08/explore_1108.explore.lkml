# Explore: explore_1108
# Auto-generated LookML Explore File

include: "/views/domain_25/view_03325.view.lkml"
include: "/views/domain_27/view_03327.view.lkml"
include: "/views/domain_28/view_03328.view.lkml"
include: "/views/domain_29/view_03329.view.lkml"

explore: explore_1108 {
  label: "Explore Explore 1108"
  description: "Comprehensive analytics explore joining base view_03325 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03325
  
  always_filter: {
    filters: [view_03325.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03325.created_at_date: "7 days"]
    unless: [view_03325.id, view_03325.status]
  }

  join: view_03327 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03325.user_id} = ${view_03327.id} ;;
    required_joins: []
  }

  join: view_03328 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03325.account_id} = ${view_03328.account_id} ;;
    required_joins: [view_03327]
  }

  join: view_03329 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03325.category} = ${view_03329.category} ;;
  }

  access_filter: {
    field: view_03325.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03325.is_deleted} = false ;;
}
