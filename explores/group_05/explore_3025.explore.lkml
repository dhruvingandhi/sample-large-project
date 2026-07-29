# Explore: explore_3025
# Auto-generated LookML Explore File

include: "/views/domain_26/view_09076.view.lkml"
include: "/views/domain_28/view_09078.view.lkml"
include: "/views/domain_29/view_09079.view.lkml"
include: "/views/domain_30/view_09080.view.lkml"

explore: explore_3025 {
  label: "Explore Explore 3025"
  description: "Comprehensive analytics explore joining base view_09076 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09076
  
  always_filter: {
    filters: [view_09076.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09076.created_at_date: "7 days"]
    unless: [view_09076.id, view_09076.status]
  }

  join: view_09078 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09076.user_id} = ${view_09078.id} ;;
    required_joins: []
  }

  join: view_09079 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09076.account_id} = ${view_09079.account_id} ;;
    required_joins: [view_09078]
  }

  join: view_09080 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09076.category} = ${view_09080.category} ;;
  }

  access_filter: {
    field: view_09076.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09076.is_deleted} = false ;;
}
