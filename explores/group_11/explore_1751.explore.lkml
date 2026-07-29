# Explore: explore_1751
# Auto-generated LookML Explore File

include: "/views/domain_04/view_05254.view.lkml"
include: "/views/domain_06/view_05256.view.lkml"
include: "/views/domain_07/view_05257.view.lkml"
include: "/views/domain_08/view_05258.view.lkml"

explore: explore_1751 {
  label: "Explore Explore 1751"
  description: "Comprehensive analytics explore joining base view_05254 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05254
  
  always_filter: {
    filters: [view_05254.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05254.created_at_date: "7 days"]
    unless: [view_05254.id, view_05254.status]
  }

  join: view_05256 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05254.user_id} = ${view_05256.id} ;;
    required_joins: []
  }

  join: view_05257 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05254.account_id} = ${view_05257.account_id} ;;
    required_joins: [view_05256]
  }

  join: view_05258 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05254.category} = ${view_05258.category} ;;
  }

  access_filter: {
    field: view_05254.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05254.is_deleted} = false ;;
}
