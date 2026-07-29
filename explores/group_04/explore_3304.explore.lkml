# Explore: explore_3304
# Auto-generated LookML Explore File

include: "/views/domain_13/view_09913.view.lkml"
include: "/views/domain_15/view_09915.view.lkml"
include: "/views/domain_16/view_09916.view.lkml"
include: "/views/domain_17/view_09917.view.lkml"

explore: explore_3304 {
  label: "Explore Explore 3304"
  description: "Comprehensive analytics explore joining base view_09913 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09913
  
  always_filter: {
    filters: [view_09913.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09913.created_at_date: "7 days"]
    unless: [view_09913.id, view_09913.status]
  }

  join: view_09915 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09913.user_id} = ${view_09915.id} ;;
    required_joins: []
  }

  join: view_09916 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09913.account_id} = ${view_09916.account_id} ;;
    required_joins: [view_09915]
  }

  join: view_09917 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09913.category} = ${view_09917.category} ;;
  }

  access_filter: {
    field: view_09913.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09913.is_deleted} = false ;;
}
