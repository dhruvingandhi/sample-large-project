# Explore: explore_2252
# Auto-generated LookML Explore File

include: "/views/domain_07/view_06757.view.lkml"
include: "/views/domain_09/view_06759.view.lkml"
include: "/views/domain_10/view_06760.view.lkml"
include: "/views/domain_11/view_06761.view.lkml"

explore: explore_2252 {
  label: "Explore Explore 2252"
  description: "Comprehensive analytics explore joining base view_06757 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06757
  
  always_filter: {
    filters: [view_06757.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06757.created_at_date: "7 days"]
    unless: [view_06757.id, view_06757.status]
  }

  join: view_06759 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06757.user_id} = ${view_06759.id} ;;
    required_joins: []
  }

  join: view_06760 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06757.account_id} = ${view_06760.account_id} ;;
    required_joins: [view_06759]
  }

  join: view_06761 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06757.category} = ${view_06761.category} ;;
  }

  access_filter: {
    field: view_06757.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06757.is_deleted} = false ;;
}
