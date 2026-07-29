# Explore: explore_3324
# Auto-generated LookML Explore File

include: "/views/domain_23/view_09973.view.lkml"
include: "/views/domain_25/view_09975.view.lkml"
include: "/views/domain_26/view_09976.view.lkml"
include: "/views/domain_27/view_09977.view.lkml"

explore: explore_3324 {
  label: "Explore Explore 3324"
  description: "Comprehensive analytics explore joining base view_09973 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09973
  
  always_filter: {
    filters: [view_09973.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09973.created_at_date: "7 days"]
    unless: [view_09973.id, view_09973.status]
  }

  join: view_09975 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09973.user_id} = ${view_09975.id} ;;
    required_joins: []
  }

  join: view_09976 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09973.account_id} = ${view_09976.account_id} ;;
    required_joins: [view_09975]
  }

  join: view_09977 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09973.category} = ${view_09977.category} ;;
  }

  access_filter: {
    field: view_09973.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09973.is_deleted} = false ;;
}
