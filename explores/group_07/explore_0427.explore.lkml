# Explore: explore_0427
# Auto-generated LookML Explore File

include: "/views/domain_32/view_01282.view.lkml"
include: "/views/domain_34/view_01284.view.lkml"
include: "/views/domain_35/view_01285.view.lkml"
include: "/views/domain_36/view_01286.view.lkml"

explore: explore_0427 {
  label: "Explore Explore 0427"
  description: "Comprehensive analytics explore joining base view_01282 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01282
  
  always_filter: {
    filters: [view_01282.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01282.created_at_date: "7 days"]
    unless: [view_01282.id, view_01282.status]
  }

  join: view_01284 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01282.user_id} = ${view_01284.id} ;;
    required_joins: []
  }

  join: view_01285 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01282.account_id} = ${view_01285.account_id} ;;
    required_joins: [view_01284]
  }

  join: view_01286 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01282.category} = ${view_01286.category} ;;
  }

  access_filter: {
    field: view_01282.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01282.is_deleted} = false ;;
}
