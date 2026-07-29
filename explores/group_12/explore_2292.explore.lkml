# Explore: explore_2292
# Auto-generated LookML Explore File

include: "/views/domain_27/view_06877.view.lkml"
include: "/views/domain_29/view_06879.view.lkml"
include: "/views/domain_30/view_06880.view.lkml"
include: "/views/domain_31/view_06881.view.lkml"

explore: explore_2292 {
  label: "Explore Explore 2292"
  description: "Comprehensive analytics explore joining base view_06877 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06877
  
  always_filter: {
    filters: [view_06877.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06877.created_at_date: "7 days"]
    unless: [view_06877.id, view_06877.status]
  }

  join: view_06879 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06877.user_id} = ${view_06879.id} ;;
    required_joins: []
  }

  join: view_06880 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06877.account_id} = ${view_06880.account_id} ;;
    required_joins: [view_06879]
  }

  join: view_06881 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06877.category} = ${view_06881.category} ;;
  }

  access_filter: {
    field: view_06877.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06877.is_deleted} = false ;;
}
