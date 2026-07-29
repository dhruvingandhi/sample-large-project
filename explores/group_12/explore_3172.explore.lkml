# Explore: explore_3172
# Auto-generated LookML Explore File

include: "/views/domain_17/view_09517.view.lkml"
include: "/views/domain_19/view_09519.view.lkml"
include: "/views/domain_20/view_09520.view.lkml"
include: "/views/domain_21/view_09521.view.lkml"

explore: explore_3172 {
  label: "Explore Explore 3172"
  description: "Comprehensive analytics explore joining base view_09517 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09517
  
  always_filter: {
    filters: [view_09517.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09517.created_at_date: "7 days"]
    unless: [view_09517.id, view_09517.status]
  }

  join: view_09519 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09517.user_id} = ${view_09519.id} ;;
    required_joins: []
  }

  join: view_09520 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09517.account_id} = ${view_09520.account_id} ;;
    required_joins: [view_09519]
  }

  join: view_09521 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09517.category} = ${view_09521.category} ;;
  }

  access_filter: {
    field: view_09517.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09517.is_deleted} = false ;;
}
