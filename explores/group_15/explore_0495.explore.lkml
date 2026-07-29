# Explore: explore_0495
# Auto-generated LookML Explore File

include: "/views/domain_36/view_01486.view.lkml"
include: "/views/domain_38/view_01488.view.lkml"
include: "/views/domain_39/view_01489.view.lkml"
include: "/views/domain_40/view_01490.view.lkml"

explore: explore_0495 {
  label: "Explore Explore 0495"
  description: "Comprehensive analytics explore joining base view_01486 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01486
  
  always_filter: {
    filters: [view_01486.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01486.created_at_date: "7 days"]
    unless: [view_01486.id, view_01486.status]
  }

  join: view_01488 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01486.user_id} = ${view_01488.id} ;;
    required_joins: []
  }

  join: view_01489 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01486.account_id} = ${view_01489.account_id} ;;
    required_joins: [view_01488]
  }

  join: view_01490 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01486.category} = ${view_01490.category} ;;
  }

  access_filter: {
    field: view_01486.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01486.is_deleted} = false ;;
}
