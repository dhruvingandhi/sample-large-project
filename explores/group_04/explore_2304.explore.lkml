# Explore: explore_2304
# Auto-generated LookML Explore File

include: "/views/domain_13/view_06913.view.lkml"
include: "/views/domain_15/view_06915.view.lkml"
include: "/views/domain_16/view_06916.view.lkml"
include: "/views/domain_17/view_06917.view.lkml"

explore: explore_2304 {
  label: "Explore Explore 2304"
  description: "Comprehensive analytics explore joining base view_06913 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06913
  
  always_filter: {
    filters: [view_06913.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06913.created_at_date: "7 days"]
    unless: [view_06913.id, view_06913.status]
  }

  join: view_06915 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06913.user_id} = ${view_06915.id} ;;
    required_joins: []
  }

  join: view_06916 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06913.account_id} = ${view_06916.account_id} ;;
    required_joins: [view_06915]
  }

  join: view_06917 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06913.category} = ${view_06917.category} ;;
  }

  access_filter: {
    field: view_06913.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06913.is_deleted} = false ;;
}
