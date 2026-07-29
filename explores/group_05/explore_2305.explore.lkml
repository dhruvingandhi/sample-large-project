# Explore: explore_2305
# Auto-generated LookML Explore File

include: "/views/domain_16/view_06916.view.lkml"
include: "/views/domain_18/view_06918.view.lkml"
include: "/views/domain_19/view_06919.view.lkml"
include: "/views/domain_20/view_06920.view.lkml"

explore: explore_2305 {
  label: "Explore Explore 2305"
  description: "Comprehensive analytics explore joining base view_06916 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06916
  
  always_filter: {
    filters: [view_06916.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06916.created_at_date: "7 days"]
    unless: [view_06916.id, view_06916.status]
  }

  join: view_06918 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06916.user_id} = ${view_06918.id} ;;
    required_joins: []
  }

  join: view_06919 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06916.account_id} = ${view_06919.account_id} ;;
    required_joins: [view_06918]
  }

  join: view_06920 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06916.category} = ${view_06920.category} ;;
  }

  access_filter: {
    field: view_06916.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06916.is_deleted} = false ;;
}
