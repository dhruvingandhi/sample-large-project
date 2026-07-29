# Explore: explore_1637
# Auto-generated LookML Explore File

include: "/views/domain_12/view_04912.view.lkml"
include: "/views/domain_14/view_04914.view.lkml"
include: "/views/domain_15/view_04915.view.lkml"
include: "/views/domain_16/view_04916.view.lkml"

explore: explore_1637 {
  label: "Explore Explore 1637"
  description: "Comprehensive analytics explore joining base view_04912 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04912
  
  always_filter: {
    filters: [view_04912.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04912.created_at_date: "7 days"]
    unless: [view_04912.id, view_04912.status]
  }

  join: view_04914 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04912.user_id} = ${view_04914.id} ;;
    required_joins: []
  }

  join: view_04915 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04912.account_id} = ${view_04915.account_id} ;;
    required_joins: [view_04914]
  }

  join: view_04916 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04912.category} = ${view_04916.category} ;;
  }

  access_filter: {
    field: view_04912.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04912.is_deleted} = false ;;
}
