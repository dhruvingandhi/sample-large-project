# Explore: explore_3068
# Auto-generated LookML Explore File

include: "/views/domain_05/view_09205.view.lkml"
include: "/views/domain_07/view_09207.view.lkml"
include: "/views/domain_08/view_09208.view.lkml"
include: "/views/domain_09/view_09209.view.lkml"

explore: explore_3068 {
  label: "Explore Explore 3068"
  description: "Comprehensive analytics explore joining base view_09205 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09205
  
  always_filter: {
    filters: [view_09205.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09205.created_at_date: "7 days"]
    unless: [view_09205.id, view_09205.status]
  }

  join: view_09207 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09205.user_id} = ${view_09207.id} ;;
    required_joins: []
  }

  join: view_09208 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09205.account_id} = ${view_09208.account_id} ;;
    required_joins: [view_09207]
  }

  join: view_09209 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09205.category} = ${view_09209.category} ;;
  }

  access_filter: {
    field: view_09205.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09205.is_deleted} = false ;;
}
