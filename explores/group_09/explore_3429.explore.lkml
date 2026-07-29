# Explore: explore_3429
# Auto-generated LookML Explore File

include: "/views/domain_38/view_10288.view.lkml"
include: "/views/domain_40/view_10290.view.lkml"
include: "/views/domain_41/view_10291.view.lkml"
include: "/views/domain_42/view_10292.view.lkml"

explore: explore_3429 {
  label: "Explore Explore 3429"
  description: "Comprehensive analytics explore joining base view_10288 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10288
  
  always_filter: {
    filters: [view_10288.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10288.created_at_date: "7 days"]
    unless: [view_10288.id, view_10288.status]
  }

  join: view_10290 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10288.user_id} = ${view_10290.id} ;;
    required_joins: []
  }

  join: view_10291 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10288.account_id} = ${view_10291.account_id} ;;
    required_joins: [view_10290]
  }

  join: view_10292 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10288.category} = ${view_10292.category} ;;
  }

  access_filter: {
    field: view_10288.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10288.is_deleted} = false ;;
}
