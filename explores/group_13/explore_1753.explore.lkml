# Explore: explore_1753
# Auto-generated LookML Explore File

include: "/views/domain_10/view_05260.view.lkml"
include: "/views/domain_12/view_05262.view.lkml"
include: "/views/domain_13/view_05263.view.lkml"
include: "/views/domain_14/view_05264.view.lkml"

explore: explore_1753 {
  label: "Explore Explore 1753"
  description: "Comprehensive analytics explore joining base view_05260 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05260
  
  always_filter: {
    filters: [view_05260.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05260.created_at_date: "7 days"]
    unless: [view_05260.id, view_05260.status]
  }

  join: view_05262 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05260.user_id} = ${view_05262.id} ;;
    required_joins: []
  }

  join: view_05263 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05260.account_id} = ${view_05263.account_id} ;;
    required_joins: [view_05262]
  }

  join: view_05264 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05260.category} = ${view_05264.category} ;;
  }

  access_filter: {
    field: view_05260.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05260.is_deleted} = false ;;
}
