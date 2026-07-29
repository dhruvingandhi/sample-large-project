# Explore: explore_2092
# Auto-generated LookML Explore File

include: "/views/domain_27/view_06277.view.lkml"
include: "/views/domain_29/view_06279.view.lkml"
include: "/views/domain_30/view_06280.view.lkml"
include: "/views/domain_31/view_06281.view.lkml"

explore: explore_2092 {
  label: "Explore Explore 2092"
  description: "Comprehensive analytics explore joining base view_06277 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06277
  
  always_filter: {
    filters: [view_06277.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06277.created_at_date: "7 days"]
    unless: [view_06277.id, view_06277.status]
  }

  join: view_06279 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06277.user_id} = ${view_06279.id} ;;
    required_joins: []
  }

  join: view_06280 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06277.account_id} = ${view_06280.account_id} ;;
    required_joins: [view_06279]
  }

  join: view_06281 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06277.category} = ${view_06281.category} ;;
  }

  access_filter: {
    field: view_06277.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06277.is_deleted} = false ;;
}
