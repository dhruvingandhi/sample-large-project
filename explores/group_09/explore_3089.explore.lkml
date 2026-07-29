# Explore: explore_3089
# Auto-generated LookML Explore File

include: "/views/domain_18/view_09268.view.lkml"
include: "/views/domain_20/view_09270.view.lkml"
include: "/views/domain_21/view_09271.view.lkml"
include: "/views/domain_22/view_09272.view.lkml"

explore: explore_3089 {
  label: "Explore Explore 3089"
  description: "Comprehensive analytics explore joining base view_09268 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09268
  
  always_filter: {
    filters: [view_09268.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09268.created_at_date: "7 days"]
    unless: [view_09268.id, view_09268.status]
  }

  join: view_09270 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09268.user_id} = ${view_09270.id} ;;
    required_joins: []
  }

  join: view_09271 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09268.account_id} = ${view_09271.account_id} ;;
    required_joins: [view_09270]
  }

  join: view_09272 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09268.category} = ${view_09272.category} ;;
  }

  access_filter: {
    field: view_09268.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09268.is_deleted} = false ;;
}
