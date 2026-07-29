# Explore: explore_3401
# Auto-generated LookML Explore File

include: "/views/domain_04/view_10204.view.lkml"
include: "/views/domain_06/view_10206.view.lkml"
include: "/views/domain_07/view_10207.view.lkml"
include: "/views/domain_08/view_10208.view.lkml"

explore: explore_3401 {
  label: "Explore Explore 3401"
  description: "Comprehensive analytics explore joining base view_10204 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10204
  
  always_filter: {
    filters: [view_10204.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10204.created_at_date: "7 days"]
    unless: [view_10204.id, view_10204.status]
  }

  join: view_10206 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10204.user_id} = ${view_10206.id} ;;
    required_joins: []
  }

  join: view_10207 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10204.account_id} = ${view_10207.account_id} ;;
    required_joins: [view_10206]
  }

  join: view_10208 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10204.category} = ${view_10208.category} ;;
  }

  access_filter: {
    field: view_10204.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10204.is_deleted} = false ;;
}
