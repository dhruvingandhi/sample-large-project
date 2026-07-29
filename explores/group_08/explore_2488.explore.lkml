# Explore: explore_2488
# Auto-generated LookML Explore File

include: "/views/domain_15/view_07465.view.lkml"
include: "/views/domain_17/view_07467.view.lkml"
include: "/views/domain_18/view_07468.view.lkml"
include: "/views/domain_19/view_07469.view.lkml"

explore: explore_2488 {
  label: "Explore Explore 2488"
  description: "Comprehensive analytics explore joining base view_07465 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07465
  
  always_filter: {
    filters: [view_07465.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07465.created_at_date: "7 days"]
    unless: [view_07465.id, view_07465.status]
  }

  join: view_07467 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07465.user_id} = ${view_07467.id} ;;
    required_joins: []
  }

  join: view_07468 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07465.account_id} = ${view_07468.account_id} ;;
    required_joins: [view_07467]
  }

  join: view_07469 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07465.category} = ${view_07469.category} ;;
  }

  access_filter: {
    field: view_07465.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07465.is_deleted} = false ;;
}
