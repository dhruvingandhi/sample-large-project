# Explore: explore_1068
# Auto-generated LookML Explore File

include: "/views/domain_05/view_03205.view.lkml"
include: "/views/domain_07/view_03207.view.lkml"
include: "/views/domain_08/view_03208.view.lkml"
include: "/views/domain_09/view_03209.view.lkml"

explore: explore_1068 {
  label: "Explore Explore 1068"
  description: "Comprehensive analytics explore joining base view_03205 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03205
  
  always_filter: {
    filters: [view_03205.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03205.created_at_date: "7 days"]
    unless: [view_03205.id, view_03205.status]
  }

  join: view_03207 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03205.user_id} = ${view_03207.id} ;;
    required_joins: []
  }

  join: view_03208 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03205.account_id} = ${view_03208.account_id} ;;
    required_joins: [view_03207]
  }

  join: view_03209 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03205.category} = ${view_03209.category} ;;
  }

  access_filter: {
    field: view_03205.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03205.is_deleted} = false ;;
}
