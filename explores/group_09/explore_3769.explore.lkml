# Explore: explore_3769
# Auto-generated LookML Explore File

include: "/views/domain_08/view_11308.view.lkml"
include: "/views/domain_10/view_11310.view.lkml"
include: "/views/domain_11/view_11311.view.lkml"
include: "/views/domain_12/view_11312.view.lkml"

explore: explore_3769 {
  label: "Explore Explore 3769"
  description: "Comprehensive analytics explore joining base view_11308 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11308
  
  always_filter: {
    filters: [view_11308.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11308.created_at_date: "7 days"]
    unless: [view_11308.id, view_11308.status]
  }

  join: view_11310 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11308.user_id} = ${view_11310.id} ;;
    required_joins: []
  }

  join: view_11311 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11308.account_id} = ${view_11311.account_id} ;;
    required_joins: [view_11310]
  }

  join: view_11312 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11308.category} = ${view_11312.category} ;;
  }

  access_filter: {
    field: view_11308.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11308.is_deleted} = false ;;
}
