# Explore: explore_1304
# Auto-generated LookML Explore File

include: "/views/domain_13/view_03913.view.lkml"
include: "/views/domain_15/view_03915.view.lkml"
include: "/views/domain_16/view_03916.view.lkml"
include: "/views/domain_17/view_03917.view.lkml"

explore: explore_1304 {
  label: "Explore Explore 1304"
  description: "Comprehensive analytics explore joining base view_03913 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03913
  
  always_filter: {
    filters: [view_03913.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03913.created_at_date: "7 days"]
    unless: [view_03913.id, view_03913.status]
  }

  join: view_03915 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03913.user_id} = ${view_03915.id} ;;
    required_joins: []
  }

  join: view_03916 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03913.account_id} = ${view_03916.account_id} ;;
    required_joins: [view_03915]
  }

  join: view_03917 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03913.category} = ${view_03917.category} ;;
  }

  access_filter: {
    field: view_03913.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03913.is_deleted} = false ;;
}
