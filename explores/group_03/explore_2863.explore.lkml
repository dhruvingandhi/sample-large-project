# Explore: explore_2863
# Auto-generated LookML Explore File

include: "/views/domain_40/view_08590.view.lkml"
include: "/views/domain_42/view_08592.view.lkml"
include: "/views/domain_43/view_08593.view.lkml"
include: "/views/domain_44/view_08594.view.lkml"

explore: explore_2863 {
  label: "Explore Explore 2863"
  description: "Comprehensive analytics explore joining base view_08590 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08590
  
  always_filter: {
    filters: [view_08590.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08590.created_at_date: "7 days"]
    unless: [view_08590.id, view_08590.status]
  }

  join: view_08592 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08590.user_id} = ${view_08592.id} ;;
    required_joins: []
  }

  join: view_08593 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08590.account_id} = ${view_08593.account_id} ;;
    required_joins: [view_08592]
  }

  join: view_08594 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08590.category} = ${view_08594.category} ;;
  }

  access_filter: {
    field: view_08590.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08590.is_deleted} = false ;;
}
