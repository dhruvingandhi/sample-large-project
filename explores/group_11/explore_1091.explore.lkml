# Explore: explore_1091
# Auto-generated LookML Explore File

include: "/views/domain_24/view_03274.view.lkml"
include: "/views/domain_26/view_03276.view.lkml"
include: "/views/domain_27/view_03277.view.lkml"
include: "/views/domain_28/view_03278.view.lkml"

explore: explore_1091 {
  label: "Explore Explore 1091"
  description: "Comprehensive analytics explore joining base view_03274 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03274
  
  always_filter: {
    filters: [view_03274.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03274.created_at_date: "7 days"]
    unless: [view_03274.id, view_03274.status]
  }

  join: view_03276 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03274.user_id} = ${view_03276.id} ;;
    required_joins: []
  }

  join: view_03277 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03274.account_id} = ${view_03277.account_id} ;;
    required_joins: [view_03276]
  }

  join: view_03278 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03274.category} = ${view_03278.category} ;;
  }

  access_filter: {
    field: view_03274.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03274.is_deleted} = false ;;
}
