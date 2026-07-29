# Explore: explore_2471
# Auto-generated LookML Explore File

include: "/views/domain_14/view_07414.view.lkml"
include: "/views/domain_16/view_07416.view.lkml"
include: "/views/domain_17/view_07417.view.lkml"
include: "/views/domain_18/view_07418.view.lkml"

explore: explore_2471 {
  label: "Explore Explore 2471"
  description: "Comprehensive analytics explore joining base view_07414 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07414
  
  always_filter: {
    filters: [view_07414.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07414.created_at_date: "7 days"]
    unless: [view_07414.id, view_07414.status]
  }

  join: view_07416 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07414.user_id} = ${view_07416.id} ;;
    required_joins: []
  }

  join: view_07417 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07414.account_id} = ${view_07417.account_id} ;;
    required_joins: [view_07416]
  }

  join: view_07418 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07414.category} = ${view_07418.category} ;;
  }

  access_filter: {
    field: view_07414.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07414.is_deleted} = false ;;
}
