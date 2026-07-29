# Explore: explore_2772
# Auto-generated LookML Explore File

include: "/views/domain_17/view_08317.view.lkml"
include: "/views/domain_19/view_08319.view.lkml"
include: "/views/domain_20/view_08320.view.lkml"
include: "/views/domain_21/view_08321.view.lkml"

explore: explore_2772 {
  label: "Explore Explore 2772"
  description: "Comprehensive analytics explore joining base view_08317 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08317
  
  always_filter: {
    filters: [view_08317.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08317.created_at_date: "7 days"]
    unless: [view_08317.id, view_08317.status]
  }

  join: view_08319 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08317.user_id} = ${view_08319.id} ;;
    required_joins: []
  }

  join: view_08320 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08317.account_id} = ${view_08320.account_id} ;;
    required_joins: [view_08319]
  }

  join: view_08321 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08317.category} = ${view_08321.category} ;;
  }

  access_filter: {
    field: view_08317.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08317.is_deleted} = false ;;
}
