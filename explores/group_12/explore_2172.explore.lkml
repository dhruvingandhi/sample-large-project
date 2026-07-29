# Explore: explore_2172
# Auto-generated LookML Explore File

include: "/views/domain_17/view_06517.view.lkml"
include: "/views/domain_19/view_06519.view.lkml"
include: "/views/domain_20/view_06520.view.lkml"
include: "/views/domain_21/view_06521.view.lkml"

explore: explore_2172 {
  label: "Explore Explore 2172"
  description: "Comprehensive analytics explore joining base view_06517 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06517
  
  always_filter: {
    filters: [view_06517.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06517.created_at_date: "7 days"]
    unless: [view_06517.id, view_06517.status]
  }

  join: view_06519 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06517.user_id} = ${view_06519.id} ;;
    required_joins: []
  }

  join: view_06520 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06517.account_id} = ${view_06520.account_id} ;;
    required_joins: [view_06519]
  }

  join: view_06521 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06517.category} = ${view_06521.category} ;;
  }

  access_filter: {
    field: view_06517.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06517.is_deleted} = false ;;
}
