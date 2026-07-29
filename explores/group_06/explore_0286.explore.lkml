# Explore: explore_0286
# Auto-generated LookML Explore File

include: "/views/domain_09/view_00859.view.lkml"
include: "/views/domain_11/view_00861.view.lkml"
include: "/views/domain_12/view_00862.view.lkml"
include: "/views/domain_13/view_00863.view.lkml"

explore: explore_0286 {
  label: "Explore Explore 0286"
  description: "Comprehensive analytics explore joining base view_00859 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00859
  
  always_filter: {
    filters: [view_00859.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00859.created_at_date: "7 days"]
    unless: [view_00859.id, view_00859.status]
  }

  join: view_00861 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00859.user_id} = ${view_00861.id} ;;
    required_joins: []
  }

  join: view_00862 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00859.account_id} = ${view_00862.account_id} ;;
    required_joins: [view_00861]
  }

  join: view_00863 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00859.category} = ${view_00863.category} ;;
  }

  access_filter: {
    field: view_00859.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00859.is_deleted} = false ;;
}
