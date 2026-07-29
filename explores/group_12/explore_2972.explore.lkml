# Explore: explore_2972
# Auto-generated LookML Explore File

include: "/views/domain_17/view_08917.view.lkml"
include: "/views/domain_19/view_08919.view.lkml"
include: "/views/domain_20/view_08920.view.lkml"
include: "/views/domain_21/view_08921.view.lkml"

explore: explore_2972 {
  label: "Explore Explore 2972"
  description: "Comprehensive analytics explore joining base view_08917 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08917
  
  always_filter: {
    filters: [view_08917.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08917.created_at_date: "7 days"]
    unless: [view_08917.id, view_08917.status]
  }

  join: view_08919 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08917.user_id} = ${view_08919.id} ;;
    required_joins: []
  }

  join: view_08920 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08917.account_id} = ${view_08920.account_id} ;;
    required_joins: [view_08919]
  }

  join: view_08921 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08917.category} = ${view_08921.category} ;;
  }

  access_filter: {
    field: view_08917.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08917.is_deleted} = false ;;
}
