# Explore: explore_0305
# Auto-generated LookML Explore File

include: "/views/domain_16/view_00916.view.lkml"
include: "/views/domain_18/view_00918.view.lkml"
include: "/views/domain_19/view_00919.view.lkml"
include: "/views/domain_20/view_00920.view.lkml"

explore: explore_0305 {
  label: "Explore Explore 0305"
  description: "Comprehensive analytics explore joining base view_00916 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00916
  
  always_filter: {
    filters: [view_00916.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00916.created_at_date: "7 days"]
    unless: [view_00916.id, view_00916.status]
  }

  join: view_00918 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00916.user_id} = ${view_00918.id} ;;
    required_joins: []
  }

  join: view_00919 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00916.account_id} = ${view_00919.account_id} ;;
    required_joins: [view_00918]
  }

  join: view_00920 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00916.category} = ${view_00920.category} ;;
  }

  access_filter: {
    field: view_00916.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00916.is_deleted} = false ;;
}
