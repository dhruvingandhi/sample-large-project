# Explore: explore_1427
# Auto-generated LookML Explore File

include: "/views/domain_32/view_04282.view.lkml"
include: "/views/domain_34/view_04284.view.lkml"
include: "/views/domain_35/view_04285.view.lkml"
include: "/views/domain_36/view_04286.view.lkml"

explore: explore_1427 {
  label: "Explore Explore 1427"
  description: "Comprehensive analytics explore joining base view_04282 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04282
  
  always_filter: {
    filters: [view_04282.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04282.created_at_date: "7 days"]
    unless: [view_04282.id, view_04282.status]
  }

  join: view_04284 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04282.user_id} = ${view_04284.id} ;;
    required_joins: []
  }

  join: view_04285 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04282.account_id} = ${view_04285.account_id} ;;
    required_joins: [view_04284]
  }

  join: view_04286 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04282.category} = ${view_04286.category} ;;
  }

  access_filter: {
    field: view_04282.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04282.is_deleted} = false ;;
}
