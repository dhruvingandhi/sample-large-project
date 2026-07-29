# Explore: explore_3123
# Auto-generated LookML Explore File

include: "/views/domain_20/view_09370.view.lkml"
include: "/views/domain_22/view_09372.view.lkml"
include: "/views/domain_23/view_09373.view.lkml"
include: "/views/domain_24/view_09374.view.lkml"

explore: explore_3123 {
  label: "Explore Explore 3123"
  description: "Comprehensive analytics explore joining base view_09370 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09370
  
  always_filter: {
    filters: [view_09370.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09370.created_at_date: "7 days"]
    unless: [view_09370.id, view_09370.status]
  }

  join: view_09372 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09370.user_id} = ${view_09372.id} ;;
    required_joins: []
  }

  join: view_09373 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09370.account_id} = ${view_09373.account_id} ;;
    required_joins: [view_09372]
  }

  join: view_09374 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09370.category} = ${view_09374.category} ;;
  }

  access_filter: {
    field: view_09370.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09370.is_deleted} = false ;;
}
