# Explore: explore_1908
# Auto-generated LookML Explore File

include: "/views/domain_25/view_05725.view.lkml"
include: "/views/domain_27/view_05727.view.lkml"
include: "/views/domain_28/view_05728.view.lkml"
include: "/views/domain_29/view_05729.view.lkml"

explore: explore_1908 {
  label: "Explore Explore 1908"
  description: "Comprehensive analytics explore joining base view_05725 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05725
  
  always_filter: {
    filters: [view_05725.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05725.created_at_date: "7 days"]
    unless: [view_05725.id, view_05725.status]
  }

  join: view_05727 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05725.user_id} = ${view_05727.id} ;;
    required_joins: []
  }

  join: view_05728 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05725.account_id} = ${view_05728.account_id} ;;
    required_joins: [view_05727]
  }

  join: view_05729 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05725.category} = ${view_05729.category} ;;
  }

  access_filter: {
    field: view_05725.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05725.is_deleted} = false ;;
}
