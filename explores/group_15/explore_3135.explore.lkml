# Explore: explore_3135
# Auto-generated LookML Explore File

include: "/views/domain_06/view_09406.view.lkml"
include: "/views/domain_08/view_09408.view.lkml"
include: "/views/domain_09/view_09409.view.lkml"
include: "/views/domain_10/view_09410.view.lkml"

explore: explore_3135 {
  label: "Explore Explore 3135"
  description: "Comprehensive analytics explore joining base view_09406 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09406
  
  always_filter: {
    filters: [view_09406.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09406.created_at_date: "7 days"]
    unless: [view_09406.id, view_09406.status]
  }

  join: view_09408 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09406.user_id} = ${view_09408.id} ;;
    required_joins: []
  }

  join: view_09409 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09406.account_id} = ${view_09409.account_id} ;;
    required_joins: [view_09408]
  }

  join: view_09410 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09406.category} = ${view_09410.category} ;;
  }

  access_filter: {
    field: view_09406.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09406.is_deleted} = false ;;
}
