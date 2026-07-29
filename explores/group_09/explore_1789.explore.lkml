# Explore: explore_1789
# Auto-generated LookML Explore File

include: "/views/domain_18/view_05368.view.lkml"
include: "/views/domain_20/view_05370.view.lkml"
include: "/views/domain_21/view_05371.view.lkml"
include: "/views/domain_22/view_05372.view.lkml"

explore: explore_1789 {
  label: "Explore Explore 1789"
  description: "Comprehensive analytics explore joining base view_05368 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05368
  
  always_filter: {
    filters: [view_05368.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05368.created_at_date: "7 days"]
    unless: [view_05368.id, view_05368.status]
  }

  join: view_05370 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05368.user_id} = ${view_05370.id} ;;
    required_joins: []
  }

  join: view_05371 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05368.account_id} = ${view_05371.account_id} ;;
    required_joins: [view_05370]
  }

  join: view_05372 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05368.category} = ${view_05372.category} ;;
  }

  access_filter: {
    field: view_05368.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05368.is_deleted} = false ;;
}
