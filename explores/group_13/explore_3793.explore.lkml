# Explore: explore_3793
# Auto-generated LookML Explore File

include: "/views/domain_30/view_11380.view.lkml"
include: "/views/domain_32/view_11382.view.lkml"
include: "/views/domain_33/view_11383.view.lkml"
include: "/views/domain_34/view_11384.view.lkml"

explore: explore_3793 {
  label: "Explore Explore 3793"
  description: "Comprehensive analytics explore joining base view_11380 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11380
  
  always_filter: {
    filters: [view_11380.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11380.created_at_date: "7 days"]
    unless: [view_11380.id, view_11380.status]
  }

  join: view_11382 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11380.user_id} = ${view_11382.id} ;;
    required_joins: []
  }

  join: view_11383 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11380.account_id} = ${view_11383.account_id} ;;
    required_joins: [view_11382]
  }

  join: view_11384 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11380.category} = ${view_11384.category} ;;
  }

  access_filter: {
    field: view_11380.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11380.is_deleted} = false ;;
}
