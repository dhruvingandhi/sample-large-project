# Explore: explore_1799
# Auto-generated LookML Explore File

include: "/views/domain_48/view_05398.view.lkml"
include: "/views/domain_50/view_05400.view.lkml"
include: "/views/domain_01/view_05401.view.lkml"
include: "/views/domain_02/view_05402.view.lkml"

explore: explore_1799 {
  label: "Explore Explore 1799"
  description: "Comprehensive analytics explore joining base view_05398 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05398
  
  always_filter: {
    filters: [view_05398.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05398.created_at_date: "7 days"]
    unless: [view_05398.id, view_05398.status]
  }

  join: view_05400 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05398.user_id} = ${view_05400.id} ;;
    required_joins: []
  }

  join: view_05401 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05398.account_id} = ${view_05401.account_id} ;;
    required_joins: [view_05400]
  }

  join: view_05402 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05398.category} = ${view_05402.category} ;;
  }

  access_filter: {
    field: view_05398.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05398.is_deleted} = false ;;
}
