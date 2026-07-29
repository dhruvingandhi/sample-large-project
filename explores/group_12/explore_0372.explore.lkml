# Explore: explore_0372
# Auto-generated LookML Explore File

include: "/views/domain_17/view_01117.view.lkml"
include: "/views/domain_19/view_01119.view.lkml"
include: "/views/domain_20/view_01120.view.lkml"
include: "/views/domain_21/view_01121.view.lkml"

explore: explore_0372 {
  label: "Explore Explore 0372"
  description: "Comprehensive analytics explore joining base view_01117 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01117
  
  always_filter: {
    filters: [view_01117.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01117.created_at_date: "7 days"]
    unless: [view_01117.id, view_01117.status]
  }

  join: view_01119 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01117.user_id} = ${view_01119.id} ;;
    required_joins: []
  }

  join: view_01120 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01117.account_id} = ${view_01120.account_id} ;;
    required_joins: [view_01119]
  }

  join: view_01121 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01117.category} = ${view_01121.category} ;;
  }

  access_filter: {
    field: view_01117.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01117.is_deleted} = false ;;
}
