# Explore: explore_0371
# Auto-generated LookML Explore File

include: "/views/domain_14/view_01114.view.lkml"
include: "/views/domain_16/view_01116.view.lkml"
include: "/views/domain_17/view_01117.view.lkml"
include: "/views/domain_18/view_01118.view.lkml"

explore: explore_0371 {
  label: "Explore Explore 0371"
  description: "Comprehensive analytics explore joining base view_01114 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01114
  
  always_filter: {
    filters: [view_01114.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01114.created_at_date: "7 days"]
    unless: [view_01114.id, view_01114.status]
  }

  join: view_01116 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01114.user_id} = ${view_01116.id} ;;
    required_joins: []
  }

  join: view_01117 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01114.account_id} = ${view_01117.account_id} ;;
    required_joins: [view_01116]
  }

  join: view_01118 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01114.category} = ${view_01118.category} ;;
  }

  access_filter: {
    field: view_01114.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01114.is_deleted} = false ;;
}
