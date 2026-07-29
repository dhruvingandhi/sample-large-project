# Explore: explore_2769
# Auto-generated LookML Explore File

include: "/views/domain_08/view_08308.view.lkml"
include: "/views/domain_10/view_08310.view.lkml"
include: "/views/domain_11/view_08311.view.lkml"
include: "/views/domain_12/view_08312.view.lkml"

explore: explore_2769 {
  label: "Explore Explore 2769"
  description: "Comprehensive analytics explore joining base view_08308 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08308
  
  always_filter: {
    filters: [view_08308.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08308.created_at_date: "7 days"]
    unless: [view_08308.id, view_08308.status]
  }

  join: view_08310 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08308.user_id} = ${view_08310.id} ;;
    required_joins: []
  }

  join: view_08311 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08308.account_id} = ${view_08311.account_id} ;;
    required_joins: [view_08310]
  }

  join: view_08312 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08308.category} = ${view_08312.category} ;;
  }

  access_filter: {
    field: view_08308.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08308.is_deleted} = false ;;
}
