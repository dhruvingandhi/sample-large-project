# Update for 500 file diff target
# Explore: explore_2385
# Auto-generated LookML Explore File

include: "/views/domain_06/view_07156.view.lkml"
include: "/views/domain_08/view_07158.view.lkml"
include: "/views/domain_09/view_07159.view.lkml"
include: "/views/domain_10/view_07160.view.lkml"

explore: explore_2385 {
  label: "Explore Explore 2385"
  description: "Comprehensive analytics explore joining base view_07156 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07156
  
  always_filter: {
    filters: [view_07156.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07156.created_at_date: "7 days"]
    unless: [view_07156.id, view_07156.status]
  }

  join: view_07158 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07156.user_id} = ${view_07158.id} ;;
    required_joins: []
  }

  join: view_07159 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07156.account_id} = ${view_07159.account_id} ;;
    required_joins: [view_07158]
  }

  join: view_07160 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07156.category} = ${view_07160.category} ;;
  }

  access_filter: {
    field: view_07156.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07156.is_deleted} = false ;;
}
