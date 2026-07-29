# Explore: explore_2829
# Auto-generated LookML Explore File

include: "/views/domain_38/view_08488.view.lkml"
include: "/views/domain_40/view_08490.view.lkml"
include: "/views/domain_41/view_08491.view.lkml"
include: "/views/domain_42/view_08492.view.lkml"

explore: explore_2829 {
  label: "Explore Explore 2829"
  description: "Comprehensive analytics explore joining base view_08488 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08488
  
  always_filter: {
    filters: [view_08488.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08488.created_at_date: "7 days"]
    unless: [view_08488.id, view_08488.status]
  }

  join: view_08490 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08488.user_id} = ${view_08490.id} ;;
    required_joins: []
  }

  join: view_08491 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08488.account_id} = ${view_08491.account_id} ;;
    required_joins: [view_08490]
  }

  join: view_08492 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08488.category} = ${view_08492.category} ;;
  }

  access_filter: {
    field: view_08488.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08488.is_deleted} = false ;;
}
