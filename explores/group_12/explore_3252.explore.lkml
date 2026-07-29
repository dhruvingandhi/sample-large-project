# Explore: explore_3252
# Auto-generated LookML Explore File

include: "/views/domain_07/view_09757.view.lkml"
include: "/views/domain_09/view_09759.view.lkml"
include: "/views/domain_10/view_09760.view.lkml"
include: "/views/domain_11/view_09761.view.lkml"

explore: explore_3252 {
  label: "Explore Explore 3252"
  description: "Comprehensive analytics explore joining base view_09757 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09757
  
  always_filter: {
    filters: [view_09757.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09757.created_at_date: "7 days"]
    unless: [view_09757.id, view_09757.status]
  }

  join: view_09759 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09757.user_id} = ${view_09759.id} ;;
    required_joins: []
  }

  join: view_09760 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09757.account_id} = ${view_09760.account_id} ;;
    required_joins: [view_09759]
  }

  join: view_09761 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09757.category} = ${view_09761.category} ;;
  }

  access_filter: {
    field: view_09757.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09757.is_deleted} = false ;;
}
