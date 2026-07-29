# Explore: explore_3675
# Auto-generated LookML Explore File

include: "/views/domain_26/view_11026.view.lkml"
include: "/views/domain_28/view_11028.view.lkml"
include: "/views/domain_29/view_11029.view.lkml"
include: "/views/domain_30/view_11030.view.lkml"

explore: explore_3675 {
  label: "Explore Explore 3675"
  description: "Comprehensive analytics explore joining base view_11026 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11026
  
  always_filter: {
    filters: [view_11026.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11026.created_at_date: "7 days"]
    unless: [view_11026.id, view_11026.status]
  }

  join: view_11028 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11026.user_id} = ${view_11028.id} ;;
    required_joins: []
  }

  join: view_11029 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11026.account_id} = ${view_11029.account_id} ;;
    required_joins: [view_11028]
  }

  join: view_11030 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11026.category} = ${view_11030.category} ;;
  }

  access_filter: {
    field: view_11026.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11026.is_deleted} = false ;;
}
