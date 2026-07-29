# Explore: explore_0575
# Auto-generated LookML Explore File

include: "/views/domain_26/view_01726.view.lkml"
include: "/views/domain_28/view_01728.view.lkml"
include: "/views/domain_29/view_01729.view.lkml"
include: "/views/domain_30/view_01730.view.lkml"

explore: explore_0575 {
  label: "Explore Explore 0575"
  description: "Comprehensive analytics explore joining base view_01726 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01726
  
  always_filter: {
    filters: [view_01726.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01726.created_at_date: "7 days"]
    unless: [view_01726.id, view_01726.status]
  }

  join: view_01728 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01726.user_id} = ${view_01728.id} ;;
    required_joins: []
  }

  join: view_01729 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01726.account_id} = ${view_01729.account_id} ;;
    required_joins: [view_01728]
  }

  join: view_01730 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01726.category} = ${view_01730.category} ;;
  }

  access_filter: {
    field: view_01726.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01726.is_deleted} = false ;;
}
