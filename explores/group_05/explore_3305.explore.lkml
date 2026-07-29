# Explore: explore_3305
# Auto-generated LookML Explore File

include: "/views/domain_16/view_09916.view.lkml"
include: "/views/domain_18/view_09918.view.lkml"
include: "/views/domain_19/view_09919.view.lkml"
include: "/views/domain_20/view_09920.view.lkml"

explore: explore_3305 {
  label: "Explore Explore 3305"
  description: "Comprehensive analytics explore joining base view_09916 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09916
  
  always_filter: {
    filters: [view_09916.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09916.created_at_date: "7 days"]
    unless: [view_09916.id, view_09916.status]
  }

  join: view_09918 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09916.user_id} = ${view_09918.id} ;;
    required_joins: []
  }

  join: view_09919 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09916.account_id} = ${view_09919.account_id} ;;
    required_joins: [view_09918]
  }

  join: view_09920 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09916.category} = ${view_09920.category} ;;
  }

  access_filter: {
    field: view_09916.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09916.is_deleted} = false ;;
}
