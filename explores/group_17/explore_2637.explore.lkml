# Explore: explore_2637
# Auto-generated LookML Explore File

include: "/views/domain_12/view_07912.view.lkml"
include: "/views/domain_14/view_07914.view.lkml"
include: "/views/domain_15/view_07915.view.lkml"
include: "/views/domain_16/view_07916.view.lkml"

explore: explore_2637 {
  label: "Explore Explore 2637"
  description: "Comprehensive analytics explore joining base view_07912 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07912
  
  always_filter: {
    filters: [view_07912.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07912.created_at_date: "7 days"]
    unless: [view_07912.id, view_07912.status]
  }

  join: view_07914 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07912.user_id} = ${view_07914.id} ;;
    required_joins: []
  }

  join: view_07915 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07912.account_id} = ${view_07915.account_id} ;;
    required_joins: [view_07914]
  }

  join: view_07916 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07912.category} = ${view_07916.category} ;;
  }

  access_filter: {
    field: view_07912.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07912.is_deleted} = false ;;
}
