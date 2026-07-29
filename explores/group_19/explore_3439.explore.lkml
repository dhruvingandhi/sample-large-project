# Explore: explore_3439
# Auto-generated LookML Explore File

include: "/views/domain_18/view_10318.view.lkml"
include: "/views/domain_20/view_10320.view.lkml"
include: "/views/domain_21/view_10321.view.lkml"
include: "/views/domain_22/view_10322.view.lkml"

explore: explore_3439 {
  label: "Explore Explore 3439"
  description: "Comprehensive analytics explore joining base view_10318 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10318
  
  always_filter: {
    filters: [view_10318.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10318.created_at_date: "7 days"]
    unless: [view_10318.id, view_10318.status]
  }

  join: view_10320 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10318.user_id} = ${view_10320.id} ;;
    required_joins: []
  }

  join: view_10321 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10318.account_id} = ${view_10321.account_id} ;;
    required_joins: [view_10320]
  }

  join: view_10322 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10318.category} = ${view_10322.category} ;;
  }

  access_filter: {
    field: view_10318.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10318.is_deleted} = false ;;
}
