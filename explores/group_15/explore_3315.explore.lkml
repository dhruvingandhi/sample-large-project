# Explore: explore_3315
# Auto-generated LookML Explore File

include: "/views/domain_46/view_09946.view.lkml"
include: "/views/domain_48/view_09948.view.lkml"
include: "/views/domain_49/view_09949.view.lkml"
include: "/views/domain_50/view_09950.view.lkml"

explore: explore_3315 {
  label: "Explore Explore 3315"
  description: "Comprehensive analytics explore joining base view_09946 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09946
  
  always_filter: {
    filters: [view_09946.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09946.created_at_date: "7 days"]
    unless: [view_09946.id, view_09946.status]
  }

  join: view_09948 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09946.user_id} = ${view_09948.id} ;;
    required_joins: []
  }

  join: view_09949 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09946.account_id} = ${view_09949.account_id} ;;
    required_joins: [view_09948]
  }

  join: view_09950 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09946.category} = ${view_09950.category} ;;
  }

  access_filter: {
    field: view_09946.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09946.is_deleted} = false ;;
}
