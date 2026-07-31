# Antigravity modified: branch dg-3
# Explore: explore_1025
# Auto-generated LookML Explore File

include: "/views/domain_26/view_03076.view.lkml"
include: "/views/domain_28/view_03078.view.lkml"
include: "/views/domain_29/view_03079.view.lkml"
include: "/views/domain_30/view_03080.view.lkml"

explore: explore_1025 {
  label: "Explore Explore 1025"
  description: "Comprehensive analytics explore joining base view_03076 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03076
  
  always_filter: {
    filters: [view_03076.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03076.created_at_date: "7 days"]
    unless: [view_03076.id, view_03076.status]
  }

  join: view_03078 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03076.user_id} = ${view_03078.id} ;;
    required_joins: []
  }

  join: view_03079 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03076.account_id} = ${view_03079.account_id} ;;
    required_joins: [view_03078]
  }

  join: view_03080 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03076.category} = ${view_03080.category} ;;
  }

  access_filter: {
    field: view_03076.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03076.is_deleted} = false ;;
}
