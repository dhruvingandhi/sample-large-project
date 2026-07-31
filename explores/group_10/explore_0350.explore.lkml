# Update for 2000 file diff target
# Explore: explore_0350
# Auto-generated LookML Explore File

include: "/views/domain_01/view_01051.view.lkml"
include: "/views/domain_03/view_01053.view.lkml"
include: "/views/domain_04/view_01054.view.lkml"
include: "/views/domain_05/view_01055.view.lkml"

explore: explore_0350 {
  label: "Explore Explore 0350"
  description: "Comprehensive analytics explore joining base view_01051 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01051
  
  always_filter: {
    filters: [view_01051.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01051.created_at_date: "7 days"]
    unless: [view_01051.id, view_01051.status]
  }

  join: view_01053 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01051.user_id} = ${view_01053.id} ;;
    required_joins: []
  }

  join: view_01054 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01051.account_id} = ${view_01054.account_id} ;;
    required_joins: [view_01053]
  }

  join: view_01055 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01051.category} = ${view_01055.category} ;;
  }

  access_filter: {
    field: view_01051.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01051.is_deleted} = false ;;
}
