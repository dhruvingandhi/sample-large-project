# Explore: explore_1037
# Auto-generated LookML Explore File

include: "/views/domain_12/view_03112.view.lkml"
include: "/views/domain_14/view_03114.view.lkml"
include: "/views/domain_15/view_03115.view.lkml"
include: "/views/domain_16/view_03116.view.lkml"

explore: explore_1037 {
  label: "Explore Explore 1037"
  description: "Comprehensive analytics explore joining base view_03112 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03112
  
  always_filter: {
    filters: [view_03112.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03112.created_at_date: "7 days"]
    unless: [view_03112.id, view_03112.status]
  }

  join: view_03114 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03112.user_id} = ${view_03114.id} ;;
    required_joins: []
  }

  join: view_03115 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03112.account_id} = ${view_03115.account_id} ;;
    required_joins: [view_03114]
  }

  join: view_03116 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03112.category} = ${view_03116.category} ;;
  }

  access_filter: {
    field: view_03112.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03112.is_deleted} = false ;;
}
