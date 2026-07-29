# Explore: explore_3160
# Auto-generated LookML Explore File

include: "/views/domain_31/view_09481.view.lkml"
include: "/views/domain_33/view_09483.view.lkml"
include: "/views/domain_34/view_09484.view.lkml"
include: "/views/domain_35/view_09485.view.lkml"

explore: explore_3160 {
  label: "Explore Explore 3160"
  description: "Comprehensive analytics explore joining base view_09481 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09481
  
  always_filter: {
    filters: [view_09481.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09481.created_at_date: "7 days"]
    unless: [view_09481.id, view_09481.status]
  }

  join: view_09483 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09481.user_id} = ${view_09483.id} ;;
    required_joins: []
  }

  join: view_09484 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09481.account_id} = ${view_09484.account_id} ;;
    required_joins: [view_09483]
  }

  join: view_09485 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09481.category} = ${view_09485.category} ;;
  }

  access_filter: {
    field: view_09481.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09481.is_deleted} = false ;;
}
