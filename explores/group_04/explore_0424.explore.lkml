# Explore: explore_0424
# Auto-generated LookML Explore File

include: "/views/domain_23/view_01273.view.lkml"
include: "/views/domain_25/view_01275.view.lkml"
include: "/views/domain_26/view_01276.view.lkml"
include: "/views/domain_27/view_01277.view.lkml"

explore: explore_0424 {
  label: "Explore Explore 0424"
  description: "Comprehensive analytics explore joining base view_01273 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01273
  
  always_filter: {
    filters: [view_01273.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01273.created_at_date: "7 days"]
    unless: [view_01273.id, view_01273.status]
  }

  join: view_01275 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01273.user_id} = ${view_01275.id} ;;
    required_joins: []
  }

  join: view_01276 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01273.account_id} = ${view_01276.account_id} ;;
    required_joins: [view_01275]
  }

  join: view_01277 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01273.category} = ${view_01277.category} ;;
  }

  access_filter: {
    field: view_01273.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01273.is_deleted} = false ;;
}
