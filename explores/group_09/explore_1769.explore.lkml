# Explore: explore_1769
# Auto-generated LookML Explore File

include: "/views/domain_08/view_05308.view.lkml"
include: "/views/domain_10/view_05310.view.lkml"
include: "/views/domain_11/view_05311.view.lkml"
include: "/views/domain_12/view_05312.view.lkml"

explore: explore_1769 {
  label: "Explore Explore 1769"
  description: "Comprehensive analytics explore joining base view_05308 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05308
  
  always_filter: {
    filters: [view_05308.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05308.created_at_date: "7 days"]
    unless: [view_05308.id, view_05308.status]
  }

  join: view_05310 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05308.user_id} = ${view_05310.id} ;;
    required_joins: []
  }

  join: view_05311 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05308.account_id} = ${view_05311.account_id} ;;
    required_joins: [view_05310]
  }

  join: view_05312 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05308.category} = ${view_05312.category} ;;
  }

  access_filter: {
    field: view_05308.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05308.is_deleted} = false ;;
}
