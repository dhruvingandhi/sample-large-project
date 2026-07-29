# Explore: explore_0304
# Auto-generated LookML Explore File

include: "/views/domain_13/view_00913.view.lkml"
include: "/views/domain_15/view_00915.view.lkml"
include: "/views/domain_16/view_00916.view.lkml"
include: "/views/domain_17/view_00917.view.lkml"

explore: explore_0304 {
  label: "Explore Explore 0304"
  description: "Comprehensive analytics explore joining base view_00913 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00913
  
  always_filter: {
    filters: [view_00913.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00913.created_at_date: "7 days"]
    unless: [view_00913.id, view_00913.status]
  }

  join: view_00915 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00913.user_id} = ${view_00915.id} ;;
    required_joins: []
  }

  join: view_00916 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00913.account_id} = ${view_00916.account_id} ;;
    required_joins: [view_00915]
  }

  join: view_00917 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00913.category} = ${view_00917.category} ;;
  }

  access_filter: {
    field: view_00913.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00913.is_deleted} = false ;;
}
