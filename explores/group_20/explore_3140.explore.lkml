# Explore: explore_3140
# Auto-generated LookML Explore File

include: "/views/domain_21/view_09421.view.lkml"
include: "/views/domain_23/view_09423.view.lkml"
include: "/views/domain_24/view_09424.view.lkml"
include: "/views/domain_25/view_09425.view.lkml"

explore: explore_3140 {
  label: "Explore Explore 3140"
  description: "Comprehensive analytics explore joining base view_09421 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09421
  
  always_filter: {
    filters: [view_09421.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09421.created_at_date: "7 days"]
    unless: [view_09421.id, view_09421.status]
  }

  join: view_09423 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09421.user_id} = ${view_09423.id} ;;
    required_joins: []
  }

  join: view_09424 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09421.account_id} = ${view_09424.account_id} ;;
    required_joins: [view_09423]
  }

  join: view_09425 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09421.category} = ${view_09425.category} ;;
  }

  access_filter: {
    field: view_09421.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09421.is_deleted} = false ;;
}
