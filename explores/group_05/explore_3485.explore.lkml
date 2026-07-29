# Explore: explore_3485
# Auto-generated LookML Explore File

include: "/views/domain_06/view_10456.view.lkml"
include: "/views/domain_08/view_10458.view.lkml"
include: "/views/domain_09/view_10459.view.lkml"
include: "/views/domain_10/view_10460.view.lkml"

explore: explore_3485 {
  label: "Explore Explore 3485"
  description: "Comprehensive analytics explore joining base view_10456 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10456
  
  always_filter: {
    filters: [view_10456.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10456.created_at_date: "7 days"]
    unless: [view_10456.id, view_10456.status]
  }

  join: view_10458 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10456.user_id} = ${view_10458.id} ;;
    required_joins: []
  }

  join: view_10459 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10456.account_id} = ${view_10459.account_id} ;;
    required_joins: [view_10458]
  }

  join: view_10460 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10456.category} = ${view_10460.category} ;;
  }

  access_filter: {
    field: view_10456.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10456.is_deleted} = false ;;
}
