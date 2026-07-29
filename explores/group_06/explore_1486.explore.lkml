# Explore: explore_1486
# Auto-generated LookML Explore File

include: "/views/domain_09/view_04459.view.lkml"
include: "/views/domain_11/view_04461.view.lkml"
include: "/views/domain_12/view_04462.view.lkml"
include: "/views/domain_13/view_04463.view.lkml"

explore: explore_1486 {
  label: "Explore Explore 1486"
  description: "Comprehensive analytics explore joining base view_04459 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04459
  
  always_filter: {
    filters: [view_04459.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04459.created_at_date: "7 days"]
    unless: [view_04459.id, view_04459.status]
  }

  join: view_04461 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04459.user_id} = ${view_04461.id} ;;
    required_joins: []
  }

  join: view_04462 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04459.account_id} = ${view_04462.account_id} ;;
    required_joins: [view_04461]
  }

  join: view_04463 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04459.category} = ${view_04463.category} ;;
  }

  access_filter: {
    field: view_04459.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04459.is_deleted} = false ;;
}
