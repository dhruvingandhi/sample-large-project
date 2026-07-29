# Explore: explore_1971
# Auto-generated LookML Explore File

include: "/views/domain_14/view_05914.view.lkml"
include: "/views/domain_16/view_05916.view.lkml"
include: "/views/domain_17/view_05917.view.lkml"
include: "/views/domain_18/view_05918.view.lkml"

explore: explore_1971 {
  label: "Explore Explore 1971"
  description: "Comprehensive analytics explore joining base view_05914 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05914
  
  always_filter: {
    filters: [view_05914.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05914.created_at_date: "7 days"]
    unless: [view_05914.id, view_05914.status]
  }

  join: view_05916 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05914.user_id} = ${view_05916.id} ;;
    required_joins: []
  }

  join: view_05917 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05914.account_id} = ${view_05917.account_id} ;;
    required_joins: [view_05916]
  }

  join: view_05918 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05914.category} = ${view_05918.category} ;;
  }

  access_filter: {
    field: view_05914.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05914.is_deleted} = false ;;
}
