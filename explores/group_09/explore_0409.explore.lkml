# Explore: explore_0409
# Auto-generated LookML Explore File

include: "/views/domain_28/view_01228.view.lkml"
include: "/views/domain_30/view_01230.view.lkml"
include: "/views/domain_31/view_01231.view.lkml"
include: "/views/domain_32/view_01232.view.lkml"

explore: explore_0409 {
  label: "Explore Explore 0409"
  description: "Comprehensive analytics explore joining base view_01228 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01228
  
  always_filter: {
    filters: [view_01228.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01228.created_at_date: "7 days"]
    unless: [view_01228.id, view_01228.status]
  }

  join: view_01230 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01228.user_id} = ${view_01230.id} ;;
    required_joins: []
  }

  join: view_01231 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01228.account_id} = ${view_01231.account_id} ;;
    required_joins: [view_01230]
  }

  join: view_01232 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01228.category} = ${view_01232.category} ;;
  }

  access_filter: {
    field: view_01228.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01228.is_deleted} = false ;;
}
