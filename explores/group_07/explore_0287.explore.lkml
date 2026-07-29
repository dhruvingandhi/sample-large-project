# Explore: explore_0287
# Auto-generated LookML Explore File

include: "/views/domain_12/view_00862.view.lkml"
include: "/views/domain_14/view_00864.view.lkml"
include: "/views/domain_15/view_00865.view.lkml"
include: "/views/domain_16/view_00866.view.lkml"

explore: explore_0287 {
  label: "Explore Explore 0287"
  description: "Comprehensive analytics explore joining base view_00862 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00862
  
  always_filter: {
    filters: [view_00862.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00862.created_at_date: "7 days"]
    unless: [view_00862.id, view_00862.status]
  }

  join: view_00864 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00862.user_id} = ${view_00864.id} ;;
    required_joins: []
  }

  join: view_00865 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00862.account_id} = ${view_00865.account_id} ;;
    required_joins: [view_00864]
  }

  join: view_00866 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00862.category} = ${view_00866.category} ;;
  }

  access_filter: {
    field: view_00862.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00862.is_deleted} = false ;;
}
