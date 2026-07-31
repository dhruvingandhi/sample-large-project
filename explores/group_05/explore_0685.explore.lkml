# Antigravity modified: branch dg-3
# Explore: explore_0685
# Auto-generated LookML Explore File

include: "/views/domain_06/view_02056.view.lkml"
include: "/views/domain_08/view_02058.view.lkml"
include: "/views/domain_09/view_02059.view.lkml"
include: "/views/domain_10/view_02060.view.lkml"

explore: explore_0685 {
  label: "Explore Explore 0685"
  description: "Comprehensive analytics explore joining base view_02056 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02056
  
  always_filter: {
    filters: [view_02056.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02056.created_at_date: "7 days"]
    unless: [view_02056.id, view_02056.status]
  }

  join: view_02058 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02056.user_id} = ${view_02058.id} ;;
    required_joins: []
  }

  join: view_02059 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02056.account_id} = ${view_02059.account_id} ;;
    required_joins: [view_02058]
  }

  join: view_02060 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02056.category} = ${view_02060.category} ;;
  }

  access_filter: {
    field: view_02056.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02056.is_deleted} = false ;;
}
