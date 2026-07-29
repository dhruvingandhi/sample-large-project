# Explore: explore_2615
# Auto-generated LookML Explore File

include: "/views/domain_46/view_07846.view.lkml"
include: "/views/domain_48/view_07848.view.lkml"
include: "/views/domain_49/view_07849.view.lkml"
include: "/views/domain_50/view_07850.view.lkml"

explore: explore_2615 {
  label: "Explore Explore 2615"
  description: "Comprehensive analytics explore joining base view_07846 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07846
  
  always_filter: {
    filters: [view_07846.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07846.created_at_date: "7 days"]
    unless: [view_07846.id, view_07846.status]
  }

  join: view_07848 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07846.user_id} = ${view_07848.id} ;;
    required_joins: []
  }

  join: view_07849 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07846.account_id} = ${view_07849.account_id} ;;
    required_joins: [view_07848]
  }

  join: view_07850 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07846.category} = ${view_07850.category} ;;
  }

  access_filter: {
    field: view_07846.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07846.is_deleted} = false ;;
}
