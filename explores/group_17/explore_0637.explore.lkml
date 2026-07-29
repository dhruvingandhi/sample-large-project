# Explore: explore_0637
# Auto-generated LookML Explore File

include: "/views/domain_12/view_01912.view.lkml"
include: "/views/domain_14/view_01914.view.lkml"
include: "/views/domain_15/view_01915.view.lkml"
include: "/views/domain_16/view_01916.view.lkml"

explore: explore_0637 {
  label: "Explore Explore 0637"
  description: "Comprehensive analytics explore joining base view_01912 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01912
  
  always_filter: {
    filters: [view_01912.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01912.created_at_date: "7 days"]
    unless: [view_01912.id, view_01912.status]
  }

  join: view_01914 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01912.user_id} = ${view_01914.id} ;;
    required_joins: []
  }

  join: view_01915 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01912.account_id} = ${view_01915.account_id} ;;
    required_joins: [view_01914]
  }

  join: view_01916 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01912.category} = ${view_01916.category} ;;
  }

  access_filter: {
    field: view_01912.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01912.is_deleted} = false ;;
}
