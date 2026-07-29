# Explore: explore_0770
# Auto-generated LookML Explore File

include: "/views/domain_11/view_02311.view.lkml"
include: "/views/domain_13/view_02313.view.lkml"
include: "/views/domain_14/view_02314.view.lkml"
include: "/views/domain_15/view_02315.view.lkml"

explore: explore_0770 {
  label: "Explore Explore 0770"
  description: "Comprehensive analytics explore joining base view_02311 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02311
  
  always_filter: {
    filters: [view_02311.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02311.created_at_date: "7 days"]
    unless: [view_02311.id, view_02311.status]
  }

  join: view_02313 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02311.user_id} = ${view_02313.id} ;;
    required_joins: []
  }

  join: view_02314 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02311.account_id} = ${view_02314.account_id} ;;
    required_joins: [view_02313]
  }

  join: view_02315 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02311.category} = ${view_02315.category} ;;
  }

  access_filter: {
    field: view_02311.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02311.is_deleted} = false ;;
}
