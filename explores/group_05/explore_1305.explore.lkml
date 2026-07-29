# Explore: explore_1305
# Auto-generated LookML Explore File

include: "/views/domain_16/view_03916.view.lkml"
include: "/views/domain_18/view_03918.view.lkml"
include: "/views/domain_19/view_03919.view.lkml"
include: "/views/domain_20/view_03920.view.lkml"

explore: explore_1305 {
  label: "Explore Explore 1305"
  description: "Comprehensive analytics explore joining base view_03916 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03916
  
  always_filter: {
    filters: [view_03916.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03916.created_at_date: "7 days"]
    unless: [view_03916.id, view_03916.status]
  }

  join: view_03918 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03916.user_id} = ${view_03918.id} ;;
    required_joins: []
  }

  join: view_03919 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03916.account_id} = ${view_03919.account_id} ;;
    required_joins: [view_03918]
  }

  join: view_03920 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03916.category} = ${view_03920.category} ;;
  }

  access_filter: {
    field: view_03916.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03916.is_deleted} = false ;;
}
