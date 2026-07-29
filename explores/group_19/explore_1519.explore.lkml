# Explore: explore_1519
# Auto-generated LookML Explore File

include: "/views/domain_08/view_04558.view.lkml"
include: "/views/domain_10/view_04560.view.lkml"
include: "/views/domain_11/view_04561.view.lkml"
include: "/views/domain_12/view_04562.view.lkml"

explore: explore_1519 {
  label: "Explore Explore 1519"
  description: "Comprehensive analytics explore joining base view_04558 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04558
  
  always_filter: {
    filters: [view_04558.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04558.created_at_date: "7 days"]
    unless: [view_04558.id, view_04558.status]
  }

  join: view_04560 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04558.user_id} = ${view_04560.id} ;;
    required_joins: []
  }

  join: view_04561 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04558.account_id} = ${view_04561.account_id} ;;
    required_joins: [view_04560]
  }

  join: view_04562 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04558.category} = ${view_04562.category} ;;
  }

  access_filter: {
    field: view_04558.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04558.is_deleted} = false ;;
}
