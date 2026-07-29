# Explore: explore_2971
# Auto-generated LookML Explore File

include: "/views/domain_14/view_08914.view.lkml"
include: "/views/domain_16/view_08916.view.lkml"
include: "/views/domain_17/view_08917.view.lkml"
include: "/views/domain_18/view_08918.view.lkml"

explore: explore_2971 {
  label: "Explore Explore 2971"
  description: "Comprehensive analytics explore joining base view_08914 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08914
  
  always_filter: {
    filters: [view_08914.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08914.created_at_date: "7 days"]
    unless: [view_08914.id, view_08914.status]
  }

  join: view_08916 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08914.user_id} = ${view_08916.id} ;;
    required_joins: []
  }

  join: view_08917 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08914.account_id} = ${view_08917.account_id} ;;
    required_joins: [view_08916]
  }

  join: view_08918 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08914.category} = ${view_08918.category} ;;
  }

  access_filter: {
    field: view_08914.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08914.is_deleted} = false ;;
}
