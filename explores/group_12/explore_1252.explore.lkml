# Explore: explore_1252
# Auto-generated LookML Explore File

include: "/views/domain_07/view_03757.view.lkml"
include: "/views/domain_09/view_03759.view.lkml"
include: "/views/domain_10/view_03760.view.lkml"
include: "/views/domain_11/view_03761.view.lkml"

explore: explore_1252 {
  label: "Explore Explore 1252"
  description: "Comprehensive analytics explore joining base view_03757 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03757
  
  always_filter: {
    filters: [view_03757.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03757.created_at_date: "7 days"]
    unless: [view_03757.id, view_03757.status]
  }

  join: view_03759 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03757.user_id} = ${view_03759.id} ;;
    required_joins: []
  }

  join: view_03760 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03757.account_id} = ${view_03760.account_id} ;;
    required_joins: [view_03759]
  }

  join: view_03761 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03757.category} = ${view_03761.category} ;;
  }

  access_filter: {
    field: view_03757.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03757.is_deleted} = false ;;
}
