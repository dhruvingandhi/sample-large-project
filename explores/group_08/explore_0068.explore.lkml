# Explore: explore_0068
# Auto-generated LookML Explore File

include: "/views/domain_05/view_00205.view.lkml"
include: "/views/domain_07/view_00207.view.lkml"
include: "/views/domain_08/view_00208.view.lkml"
include: "/views/domain_09/view_00209.view.lkml"

explore: explore_0068 {
  label: "Explore Explore 0068"
  description: "Comprehensive analytics explore joining base view_00205 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00205
  
  always_filter: {
    filters: [view_00205.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00205.created_at_date: "7 days"]
    unless: [view_00205.id, view_00205.status]
  }

  join: view_00207 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00205.user_id} = ${view_00207.id} ;;
    required_joins: []
  }

  join: view_00208 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00205.account_id} = ${view_00208.account_id} ;;
    required_joins: [view_00207]
  }

  join: view_00209 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00205.category} = ${view_00209.category} ;;
  }

  access_filter: {
    field: view_00205.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00205.is_deleted} = false ;;
}
