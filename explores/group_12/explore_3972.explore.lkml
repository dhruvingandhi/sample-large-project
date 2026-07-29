# Explore: explore_3972
# Auto-generated LookML Explore File

include: "/views/domain_17/view_11917.view.lkml"
include: "/views/domain_19/view_11919.view.lkml"
include: "/views/domain_20/view_11920.view.lkml"
include: "/views/domain_21/view_11921.view.lkml"

explore: explore_3972 {
  label: "Explore Explore 3972"
  description: "Comprehensive analytics explore joining base view_11917 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11917
  
  always_filter: {
    filters: [view_11917.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11917.created_at_date: "7 days"]
    unless: [view_11917.id, view_11917.status]
  }

  join: view_11919 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11917.user_id} = ${view_11919.id} ;;
    required_joins: []
  }

  join: view_11920 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11917.account_id} = ${view_11920.account_id} ;;
    required_joins: [view_11919]
  }

  join: view_11921 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11917.category} = ${view_11921.category} ;;
  }

  access_filter: {
    field: view_11917.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11917.is_deleted} = false ;;
}
