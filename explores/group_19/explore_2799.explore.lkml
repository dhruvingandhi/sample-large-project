# Explore: explore_2799
# Auto-generated LookML Explore File

include: "/views/domain_48/view_08398.view.lkml"
include: "/views/domain_50/view_08400.view.lkml"
include: "/views/domain_01/view_08401.view.lkml"
include: "/views/domain_02/view_08402.view.lkml"

explore: explore_2799 {
  label: "Explore Explore 2799"
  description: "Comprehensive analytics explore joining base view_08398 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08398
  
  always_filter: {
    filters: [view_08398.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08398.created_at_date: "7 days"]
    unless: [view_08398.id, view_08398.status]
  }

  join: view_08400 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08398.user_id} = ${view_08400.id} ;;
    required_joins: []
  }

  join: view_08401 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08398.account_id} = ${view_08401.account_id} ;;
    required_joins: [view_08400]
  }

  join: view_08402 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08398.category} = ${view_08402.category} ;;
  }

  access_filter: {
    field: view_08398.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08398.is_deleted} = false ;;
}
