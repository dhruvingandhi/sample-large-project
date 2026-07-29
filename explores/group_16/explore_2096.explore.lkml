# Explore: explore_2096
# Auto-generated LookML Explore File

include: "/views/domain_39/view_06289.view.lkml"
include: "/views/domain_41/view_06291.view.lkml"
include: "/views/domain_42/view_06292.view.lkml"
include: "/views/domain_43/view_06293.view.lkml"

explore: explore_2096 {
  label: "Explore Explore 2096"
  description: "Comprehensive analytics explore joining base view_06289 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06289
  
  always_filter: {
    filters: [view_06289.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06289.created_at_date: "7 days"]
    unless: [view_06289.id, view_06289.status]
  }

  join: view_06291 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06289.user_id} = ${view_06291.id} ;;
    required_joins: []
  }

  join: view_06292 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06289.account_id} = ${view_06292.account_id} ;;
    required_joins: [view_06291]
  }

  join: view_06293 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06289.category} = ${view_06293.category} ;;
  }

  access_filter: {
    field: view_06289.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06289.is_deleted} = false ;;
}
