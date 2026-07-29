# Explore: explore_2522
# Auto-generated LookML Explore File

include: "/views/domain_17/view_07567.view.lkml"
include: "/views/domain_19/view_07569.view.lkml"
include: "/views/domain_20/view_07570.view.lkml"
include: "/views/domain_21/view_07571.view.lkml"

explore: explore_2522 {
  label: "Explore Explore 2522"
  description: "Comprehensive analytics explore joining base view_07567 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07567
  
  always_filter: {
    filters: [view_07567.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07567.created_at_date: "7 days"]
    unless: [view_07567.id, view_07567.status]
  }

  join: view_07569 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07567.user_id} = ${view_07569.id} ;;
    required_joins: []
  }

  join: view_07570 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07567.account_id} = ${view_07570.account_id} ;;
    required_joins: [view_07569]
  }

  join: view_07571 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07567.category} = ${view_07571.category} ;;
  }

  access_filter: {
    field: view_07567.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07567.is_deleted} = false ;;
}
