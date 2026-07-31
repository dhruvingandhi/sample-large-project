# Update for 2000 file diff target
# Explore: explore_1770
# Auto-generated LookML Explore File

include: "/views/domain_11/view_05311.view.lkml"
include: "/views/domain_13/view_05313.view.lkml"
include: "/views/domain_14/view_05314.view.lkml"
include: "/views/domain_15/view_05315.view.lkml"

explore: explore_1770 {
  label: "Explore Explore 1770"
  description: "Comprehensive analytics explore joining base view_05311 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05311
  
  always_filter: {
    filters: [view_05311.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05311.created_at_date: "7 days"]
    unless: [view_05311.id, view_05311.status]
  }

  join: view_05313 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05311.user_id} = ${view_05313.id} ;;
    required_joins: []
  }

  join: view_05314 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05311.account_id} = ${view_05314.account_id} ;;
    required_joins: [view_05313]
  }

  join: view_05315 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05311.category} = ${view_05315.category} ;;
  }

  access_filter: {
    field: view_05311.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05311.is_deleted} = false ;;
}
