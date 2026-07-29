# Explore: explore_2853
# Auto-generated LookML Explore File

include: "/views/domain_10/view_08560.view.lkml"
include: "/views/domain_12/view_08562.view.lkml"
include: "/views/domain_13/view_08563.view.lkml"
include: "/views/domain_14/view_08564.view.lkml"

explore: explore_2853 {
  label: "Explore Explore 2853"
  description: "Comprehensive analytics explore joining base view_08560 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08560
  
  always_filter: {
    filters: [view_08560.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08560.created_at_date: "7 days"]
    unless: [view_08560.id, view_08560.status]
  }

  join: view_08562 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08560.user_id} = ${view_08562.id} ;;
    required_joins: []
  }

  join: view_08563 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08560.account_id} = ${view_08563.account_id} ;;
    required_joins: [view_08562]
  }

  join: view_08564 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08560.category} = ${view_08564.category} ;;
  }

  access_filter: {
    field: view_08560.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08560.is_deleted} = false ;;
}
