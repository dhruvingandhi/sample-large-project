# Explore: explore_3933
# Auto-generated LookML Explore File

include: "/views/domain_50/view_11800.view.lkml"
include: "/views/domain_02/view_11802.view.lkml"
include: "/views/domain_03/view_11803.view.lkml"
include: "/views/domain_04/view_11804.view.lkml"

explore: explore_3933 {
  label: "Explore Explore 3933"
  description: "Comprehensive analytics explore joining base view_11800 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11800
  
  always_filter: {
    filters: [view_11800.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11800.created_at_date: "7 days"]
    unless: [view_11800.id, view_11800.status]
  }

  join: view_11802 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11800.user_id} = ${view_11802.id} ;;
    required_joins: []
  }

  join: view_11803 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11800.account_id} = ${view_11803.account_id} ;;
    required_joins: [view_11802]
  }

  join: view_11804 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11800.category} = ${view_11804.category} ;;
  }

  access_filter: {
    field: view_11800.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11800.is_deleted} = false ;;
}
