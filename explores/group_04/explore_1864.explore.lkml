# Explore: explore_1864
# Auto-generated LookML Explore File

include: "/views/domain_43/view_05593.view.lkml"
include: "/views/domain_45/view_05595.view.lkml"
include: "/views/domain_46/view_05596.view.lkml"
include: "/views/domain_47/view_05597.view.lkml"

explore: explore_1864 {
  label: "Explore Explore 1864"
  description: "Comprehensive analytics explore joining base view_05593 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05593
  
  always_filter: {
    filters: [view_05593.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05593.created_at_date: "7 days"]
    unless: [view_05593.id, view_05593.status]
  }

  join: view_05595 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05593.user_id} = ${view_05595.id} ;;
    required_joins: []
  }

  join: view_05596 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05593.account_id} = ${view_05596.account_id} ;;
    required_joins: [view_05595]
  }

  join: view_05597 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05593.category} = ${view_05597.category} ;;
  }

  access_filter: {
    field: view_05593.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05593.is_deleted} = false ;;
}
