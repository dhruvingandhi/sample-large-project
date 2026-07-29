# Explore: explore_2126
# Auto-generated LookML Explore File

include: "/views/domain_29/view_06379.view.lkml"
include: "/views/domain_31/view_06381.view.lkml"
include: "/views/domain_32/view_06382.view.lkml"
include: "/views/domain_33/view_06383.view.lkml"

explore: explore_2126 {
  label: "Explore Explore 2126"
  description: "Comprehensive analytics explore joining base view_06379 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06379
  
  always_filter: {
    filters: [view_06379.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06379.created_at_date: "7 days"]
    unless: [view_06379.id, view_06379.status]
  }

  join: view_06381 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06379.user_id} = ${view_06381.id} ;;
    required_joins: []
  }

  join: view_06382 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06379.account_id} = ${view_06382.account_id} ;;
    required_joins: [view_06381]
  }

  join: view_06383 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06379.category} = ${view_06383.category} ;;
  }

  access_filter: {
    field: view_06379.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06379.is_deleted} = false ;;
}
