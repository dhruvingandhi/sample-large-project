# Explore: explore_2734
# Auto-generated LookML Explore File

include: "/views/domain_03/view_08203.view.lkml"
include: "/views/domain_05/view_08205.view.lkml"
include: "/views/domain_06/view_08206.view.lkml"
include: "/views/domain_07/view_08207.view.lkml"

explore: explore_2734 {
  label: "Explore Explore 2734"
  description: "Comprehensive analytics explore joining base view_08203 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08203
  
  always_filter: {
    filters: [view_08203.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08203.created_at_date: "7 days"]
    unless: [view_08203.id, view_08203.status]
  }

  join: view_08205 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08203.user_id} = ${view_08205.id} ;;
    required_joins: []
  }

  join: view_08206 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08203.account_id} = ${view_08206.account_id} ;;
    required_joins: [view_08205]
  }

  join: view_08207 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08203.category} = ${view_08207.category} ;;
  }

  access_filter: {
    field: view_08203.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08203.is_deleted} = false ;;
}
